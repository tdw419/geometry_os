; DESCRIPTION: Render a colored object at the screen.

; Test label resolution
    LDI r2, 1
    LDI r20, 64
loop_start:
    RAND r9
    LDI r11, 3
    MOD r9, r11
    CMPI r9, 0
    JNZ r12, mid_case
    CMPI r9, 1
    JNZ r12, dark_case
    LDI r9, 1
    JMP store_it
mid_case:
    LDI r9, 2
    JMP store_it
dark_case:
    LDI r9, 3
store_it:
    STORE r20, r9
    ADD r20, r2
    SUB r21, r2
    CMPI r21, 0
    JNZ r12, loop_start
    HALT
