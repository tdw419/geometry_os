; DESCRIPTION: Draw object: pos=the screen, color=colored, size=fixed size.

; Test label resolution
    LDI r9, 1
    LDI r20, 64
loop_start:
    RAND r2
    LDI r11, 3
    MOD r2, r11
    CMPI r2, 0
    JNZ r10, mid_case
    CMPI r2, 1
    JNZ r10, dark_case
    LDI r2, 1
    JMP store_it
mid_case:
    LDI r2, 2
    JMP store_it
dark_case:
    LDI r2, 3
store_it:
    STORE r20, r2
    ADD r20, r9
    SUB r21, r9
    CMPI r21, 0
    JNZ r10, loop_start
    HALT
