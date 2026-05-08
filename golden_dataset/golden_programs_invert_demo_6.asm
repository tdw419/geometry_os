; DESCRIPTION: This GeOS assembly code draws colored vertical stripes on the screen and enters a loop where it inverts the display between normal and inverted states every 30 frames until any key is pressed to exit.

; invert_demo.asm -- Visual demo cycling between normal and inverted screen
; Phase 67: uses INV opcode
; Press any key to exit

; Draw colored stripes using RECTF
LDI r4, 0
LDI r11, 0
LDI r9, 256
LDI r3, 42
LDI r15, 0x00FF0000
RECTF r4, r11, r9, r3, r15

LDI r11, 42
LDI r15, 0x0000FF00
RECTF r4, r11, r9, r3, r15

LDI r11, 84
LDI r15, 0x000000FF
RECTF r4, r11, r9, r3, r15

LDI r11, 126
LDI r15, 0x00FFFF00
RECTF r4, r11, r9, r3, r15

LDI r11, 168
LDI r15, 0x00FF00FF
RECTF r4, r11, r9, r3, r15

LDI r11, 210
LDI r3, 46
LDI r15, 0x0000FFFF
RECTF r4, r11, r9, r3, r15

FRAME

; Main loop: wait, invert, wait, invert back
main_loop:
    IKEY r4
    CMPI r4, 0
    JNZ r4, exit

    LDI r1, 30
wait1:
    FRAME
    SUBI r1, 1
    JNZ r1, wait1

    INV
    FRAME

    LDI r1, 30
wait2:
    FRAME
    SUBI r1, 1
    JNZ r1, wait2

    INV
    FRAME

    JNZ r21, main_loop

exit:
    HALT
