; DESCRIPTION: Geometry OS program to draw a colored object.

; Test label resolution
    LDI r13, 1
    LDI r20, 64
loop_start:
    RAND r6
    LDI r9, 3
    MOD r6, r9
    CMPI r6, 0
    JNZ r7, mid_case
    CMPI r6, 1
    JNZ r7, dark_case
    LDI r6, 1
    JMP store_it
mid_case:
    LDI r6, 2
    JMP store_it
dark_case:
    LDI r6, 3
store_it:
    STORE r20, r6
    ADD r20, r13
    SUB r21, r13
    CMPI r21, 0
    JNZ r7, loop_start
    HALT
