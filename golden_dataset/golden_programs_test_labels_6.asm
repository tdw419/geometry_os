; DESCRIPTION: Draws a colored object at the screen with fixed size.

; Test label resolution
    LDI r4, 1
    LDI r20, 64
loop_start:
    RAND r15
    LDI r8, 3
    MOD r15, r8
    CMPI r15, 0
    JNZ r5, mid_case
    CMPI r15, 1
    JNZ r5, dark_case
    LDI r15, 1
    JMP store_it
mid_case:
    LDI r15, 2
    JMP store_it
dark_case:
    LDI r15, 3
store_it:
    STORE r20, r15
    ADD r20, r4
    SUB r21, r4
    CMPI r21, 0
    JNZ r5, loop_start
    HALT
