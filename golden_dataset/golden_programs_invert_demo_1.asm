; DESCRIPTION: This GeOS assembly code draws colored vertical stripes on the screen and enters a loop where it inverts the display between normal and inverted states every 30 frames until any key is pressed to exit.

; invert_demo.asm -- Visual demo cycling between normal and inverted screen
; Phase 67: uses INV opcode
; Press any key to exit

; Draw colored stripes using RECTF
LDI r10, 0
LDI r4, 0
LDI r8, 256
LDI r7, 42
LDI r3, 0x00FF0000
RECTF r10, r4, r8, r7, r3

LDI r4, 42
LDI r3, 0x0000FF00
RECTF r10, r4, r8, r7, r3

LDI r4, 84
LDI r3, 0x000000FF
RECTF r10, r4, r8, r7, r3

LDI r4, 126
LDI r3, 0x00FFFF00
RECTF r10, r4, r8, r7, r3

LDI r4, 168
LDI r3, 0x00FF00FF
RECTF r10, r4, r8, r7, r3

LDI r4, 210
LDI r7, 46
LDI r3, 0x0000FFFF
RECTF r10, r4, r8, r7, r3

FRAME

; Main loop: wait, invert, wait, invert back
main_loop:
    IKEY r10
    CMPI r10, 0
    JNZ r10, exit

    LDI r13, 30
wait1:
    FRAME
    SUBI r13, 1
    JNZ r13, wait1

    INV
    FRAME

    LDI r13, 30
wait2:
    FRAME
    SUBI r13, 1
    JNZ r13, wait2

    INV
    FRAME

    JNZ r21, main_loop

exit:
    HALT
