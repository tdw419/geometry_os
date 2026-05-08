; DESCRIPTION: This GeOS assembly code draws colored vertical stripes on the screen and enters a loop where it inverts the display between normal and inverted states every 30 frames until any key is pressed to exit.

; invert_demo.asm -- Visual demo cycling between normal and inverted screen
; Phase 67: uses INV opcode
; Press any key to exit

; Draw colored stripes using RECTF
LDI r13, 0
LDI r4, 0
LDI r5, 256
LDI r10, 42
LDI r3, 0x00FF0000
RECTF r13, r4, r5, r10, r3

LDI r4, 42
LDI r3, 0x0000FF00
RECTF r13, r4, r5, r10, r3

LDI r4, 84
LDI r3, 0x000000FF
RECTF r13, r4, r5, r10, r3

LDI r4, 126
LDI r3, 0x00FFFF00
RECTF r13, r4, r5, r10, r3

LDI r4, 168
LDI r3, 0x00FF00FF
RECTF r13, r4, r5, r10, r3

LDI r4, 210
LDI r10, 46
LDI r3, 0x0000FFFF
RECTF r13, r4, r5, r10, r3

FRAME

; Main loop: wait, invert, wait, invert back
main_loop:
    IKEY r13
    CMPI r13, 0
    JNZ r13, exit

    LDI r7, 30
wait1:
    FRAME
    SUBI r7, 1
    JNZ r7, wait1

    INV
    FRAME

    LDI r7, 30
wait2:
    FRAME
    SUBI r7, 1
    JNZ r7, wait2

    INV
    FRAME

    JNZ r21, main_loop

exit:
    HALT
