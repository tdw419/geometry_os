; Test label resolution
    LDI r1, 1
    LDI r20, 64
loop_start:
    RAND r2
    LDI r3, 3
    MOD r2, r3
    CMPI r2, 0
    JNZ r0, mid_case
    CMPI r2, 1
    JNZ r0, dark_case
    LDI r2, 1
    JMP store_it
mid_case:
    LDI r2, 2
    JMP store_it
dark_case:
    LDI r2, 3
store_it:
    STORE r20, r2
    ADD r20, r1
    SUB r21, r1
    CMPI r21, 0
    JNZ r0, loop_start
    HALT
