; DESCRIPTION: This GeOS assembly code draws colored vertical stripes on the screen and enters a loop where it inverts the display between normal and inverted states every 30 frames until any key is pressed to exit.

; invert_demo.asm -- Visual demo cycling between normal and inverted screen
; Phase 67: uses INV opcode
; Press any key to exit

; Draw colored stripes using RECTF
LDI r4, 0
LDI r13, 0
LDI r12, 256
LDI r10, 42
LDI r6, 0x00FF0000
RECTF r4, r13, r12, r10, r6

LDI r13, 42
LDI r6, 0x0000FF00
RECTF r4, r13, r12, r10, r6

LDI r13, 84
LDI r6, 0x000000FF
RECTF r4, r13, r12, r10, r6

LDI r13, 126
LDI r6, 0x00FFFF00
RECTF r4, r13, r12, r10, r6

LDI r13, 168
LDI r6, 0x00FF00FF
RECTF r4, r13, r12, r10, r6

LDI r13, 210
LDI r10, 46
LDI r6, 0x0000FFFF
RECTF r4, r13, r12, r10, r6

FRAME

; Main loop: wait, invert, wait, invert back
main_loop:
    IKEY r4
    CMPI r4, 0
    JNZ r4, exit

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
