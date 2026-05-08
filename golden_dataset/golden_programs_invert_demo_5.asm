; DESCRIPTION: Draws a red object at the screen with fixed size.

; invert_demo.asm -- Visual demo cycling between normal and inverted screen
; Phase 67: uses INV opcode
; Press any key to exit

; Draw colored stripes using RECTF
LDI r13, 0
LDI r4, 0
LDI r5, 256
LDI r9, 42
LDI r11, 0x00FF0000
RECTF r13, r4, r5, r9, r11

LDI r4, 42
LDI r11, 0x0000FF00
RECTF r13, r4, r5, r9, r11

LDI r4, 84
LDI r11, 0x000000FF
RECTF r13, r4, r5, r9, r11

LDI r4, 126
LDI r11, 0x00FFFF00
RECTF r13, r4, r5, r9, r11

LDI r4, 168
LDI r11, 0x00FF00FF
RECTF r13, r4, r5, r9, r11

LDI r4, 210
LDI r9, 46
LDI r11, 0x0000FFFF
RECTF r13, r4, r5, r9, r11

FRAME

; Main loop: wait, invert, wait, invert back
main_loop:
    IKEY r13
    CMPI r13, 0
    JNZ r13, exit

    LDI r2, 30
wait1:
    FRAME
    SUBI r2, 1
    JNZ r2, wait1

    INV
    FRAME

    LDI r2, 30
wait2:
    FRAME
    SUBI r2, 1
    JNZ r2, wait2

    INV
    FRAME

    JNZ r21, main_loop

exit:
    HALT
