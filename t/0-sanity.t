# vim:set ft=perl ts=4 sw=4 et fdm=marker:
use lib 'lib';
use Test::Nginx::Socket;

repeat_each(2);

plan tests => blocks() * repeat_each() * 2;

run_tests();

__DATA__

=== TEST 1: sanity (integer)
--- config
    location /lua {
        echo 2;
    }
--- request
GET /lua
--- response_body
2



=== TEST 2: sanity (string)
--- config
    location /lua {
        echo "helloworld";
    }
--- request
GET /lua
--- response_body
helloworld

