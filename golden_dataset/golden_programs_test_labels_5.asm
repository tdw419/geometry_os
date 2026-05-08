; DESCRIPTION: Display a object using color colored at the screen.

; Test label resolution
    LDI r11, 1
    LDI r20, 64
loop_start:
    RAND r14
    LDI r4, 3
    MOD r14, r4
    CMPI r14, 0
    JNZ r13, mid_case
    CMPI r14, 1
    JNZ r13, dark_case
    LDI r14, 1
    JMP store_it
mid_case:
    LDI r14, 2
    JMP store_it
dark_case:
    LDI r14, 3
store_it:
    STORE r20, r14
    ADD r20, r11
    SUB r21, r11
    CMPI r21, 0
    JNZ r13, loop_start
    HALT
