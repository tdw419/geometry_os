; DESCRIPTION: Draws a red object at the screen with fixed size.

; invert_demo.asm -- Visual demo cycling between normal and inverted screen
; Phase 67: uses INV opcode
; Press any key to exit

; Draw colored stripes using RECTF
LDI r10, 0
LDI r2, 0
LDI r5, 256
LDI r0, 42
LDI r3, 0x00FF0000
RECTF r10, r2, r5, r0, r3

LDI r2, 42
LDI r3, 0x0000FF00
RECTF r10, r2, r5, r0, r3

LDI r2, 84
LDI r3, 0x000000FF
RECTF r10, r2, r5, r0, r3

LDI r2, 126
LDI r3, 0x00FFFF00
RECTF r10, r2, r5, r0, r3

LDI r2, 168
LDI r3, 0x00FF00FF
RECTF r10, r2, r5, r0, r3

LDI r2, 210
LDI r0, 46
LDI r3, 0x0000FFFF
RECTF r10, r2, r5, r0, r3

FRAME

; Main loop: wait, invert, wait, invert back
main_loop:
    IKEY r10
    CMPI r10, 0
    JNZ r10, exit

    LDI r4, 30
wait1:
    FRAME
    SUBI r4, 1
    JNZ r4, wait1

    INV
    FRAME

    LDI r4, 30
wait2:
    FRAME
    SUBI r4, 1
    JNZ r4, wait2

    INV
    FRAME

    JNZ r21, main_loop

exit:
    HALT
