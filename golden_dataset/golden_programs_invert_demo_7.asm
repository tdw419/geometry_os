; DESCRIPTION: This GeOS assembly code draws colored vertical stripes on the screen and enters a loop where it inverts the display between normal and inverted states every 30 frames until any key is pressed to exit.

; invert_demo.asm -- Visual demo cycling between normal and inverted screen
; Phase 67: uses INV opcode
; Press any key to exit

; Draw colored stripes using RECTF
LDI r2, 0
LDI r9, 0
LDI r15, 256
LDI r5, 42
LDI r6, 0x00FF0000
RECTF r2, r9, r15, r5, r6

LDI r9, 42
LDI r6, 0x0000FF00
RECTF r2, r9, r15, r5, r6

LDI r9, 84
LDI r6, 0x000000FF
RECTF r2, r9, r15, r5, r6

LDI r9, 126
LDI r6, 0x00FFFF00
RECTF r2, r9, r15, r5, r6

LDI r9, 168
LDI r6, 0x00FF00FF
RECTF r2, r9, r15, r5, r6

LDI r9, 210
LDI r5, 46
LDI r6, 0x0000FFFF
RECTF r2, r9, r15, r5, r6

FRAME

; Main loop: wait, invert, wait, invert back
main_loop:
    IKEY r2
    CMPI r2, 0
    JNZ r2, exit

    LDI r8, 30
wait1:
    FRAME
    SUBI r8, 1
    JNZ r8, wait1

    INV
    FRAME

    LDI r8, 30
wait2:
    FRAME
    SUBI r8, 1
    JNZ r8, wait2

    INV
    FRAME

    JNZ r21, main_loop

exit:
    HALT
