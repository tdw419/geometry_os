; DESCRIPTION: Draws a colored object at the screen with fixed size.

; Test label resolution
    LDI r4, 1
    LDI r20, 64
loop_start:
    RAND r5
    LDI r1, 3
    MOD r5, r1
    CMPI r5, 0
    JNZ r13, mid_case
    CMPI r5, 1
    JNZ r13, dark_case
    LDI r5, 1
    JMP store_it
mid_case:
    LDI r5, 2
    JMP store_it
dark_case:
    LDI r5, 3
store_it:
    STORE r20, r5
    ADD r20, r4
    SUB r21, r4
    CMPI r21, 0
    JNZ r13, loop_start
    HALT
