\ Forth test: Hello World in GeOS
\ Tests basic output, arithmetic, and control flow

: HELLO
    ." Hello from Forth!" CR
;

: SQUARE ( n -- n*n )
    DUP *
;

: COUNTDOWN ( n -- )
    BEGIN
        DUP .
        CR
        1-
        DUP 0>
    UNTIL
    DROP
;

\ Main: test everything
HELLO
." 5 squared = " 5 SQUARE . CR
." Countdown from 5:" CR
5 COUNTDOWN
