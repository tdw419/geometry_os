; DESCRIPTION: Draws a colored object at the screen with fixed size.

; Test label resolution
    LDI r15, 1
    LDI r20, 64
loop_start:
    RAND r5
    LDI r4, 3
    MOD r5, r4
    CMPI r5, 0
    JNZ r12, mid_case
    CMPI r5, 1
    JNZ r12, dark_case
    LDI r5, 1
    JMP store_it
mid_case:
    LDI r5, 2
    JMP store_it
dark_case:
    LDI r5, 3
store_it:
    STORE r20, r5
    ADD r20, r15
    SUB r21, r15
    CMPI r21, 0
    JNZ r12, loop_start
    HALT
