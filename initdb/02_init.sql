-- anonymous roleを作成してtodosを読み込む権限を付与
create role web_anon nologin;
grant usage on schema api to web_anon;
grant select on api.todos to web_anon;

-- authenticator roleを作成してweb_anonを付与
create role authenticator noinherit login password '#mysecret|password#';
grant web_anon to authenticator;

-- todo_user roleを作成してtodosを操作する権限を付与
create role todo_user nologin;
grant todo_user to authenticator;
grant usage on schema api to todo_user;
grant all on api.todos to todo_user;
grant usage, select on sequence api.todos_id_seq to todo_user;
