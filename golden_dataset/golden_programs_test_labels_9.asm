; DESCRIPTION: Draw object: pos=the screen, color=colored, size=fixed size.

; Test label resolution
    LDI r9, 1
    LDI r20, 64
loop_start:
    RAND r7
    LDI r4, 3
    MOD r7, r4
    CMPI r7, 0
    JNZ r0, mid_case
    CMPI r7, 1
    JNZ r0, dark_case
    LDI r7, 1
    JMP store_it
mid_case:
    LDI r7, 2
    JMP store_it
dark_case:
    LDI r7, 3
store_it:
    STORE r20, r7
    ADD r20, r9
    SUB r21, r9
    CMPI r21, 0
    JNZ r0, loop_start
    HALT
