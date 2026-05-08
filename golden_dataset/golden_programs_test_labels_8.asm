; DESCRIPTION: Geometry OS program to draw a colored object.

; Test label resolution
    LDI r14, 1
    LDI r20, 64
loop_start:
    RAND r11
    LDI r10, 3
    MOD r11, r10
    CMPI r11, 0
    JNZ r13, mid_case
    CMPI r11, 1
    JNZ r13, dark_case
    LDI r11, 1
    JMP store_it
mid_case:
    LDI r11, 2
    JMP store_it
dark_case:
    LDI r11, 3
store_it:
    STORE r20, r11
    ADD r20, r14
    SUB r21, r14
    CMPI r21, 0
    JNZ r13, loop_start
    HALT
