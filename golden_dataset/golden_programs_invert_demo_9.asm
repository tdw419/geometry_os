; DESCRIPTION: Draws a red object at the screen with fixed size.

; invert_demo.asm -- Visual demo cycling between normal and inverted screen
; Phase 67: uses INV opcode
; Press any key to exit

; Draw colored stripes using RECTF
LDI r14, 0
LDI r10, 0
LDI r7, 256
LDI r6, 42
LDI r3, 0x00FF0000
RECTF r14, r10, r7, r6, r3

LDI r10, 42
LDI r3, 0x0000FF00
RECTF r14, r10, r7, r6, r3

LDI r10, 84
LDI r3, 0x000000FF
RECTF r14, r10, r7, r6, r3

LDI r10, 126
LDI r3, 0x00FFFF00
RECTF r14, r10, r7, r6, r3

LDI r10, 168
LDI r3, 0x00FF00FF
RECTF r14, r10, r7, r6, r3

LDI r10, 210
LDI r6, 46
LDI r3, 0x0000FFFF
RECTF r14, r10, r7, r6, r3

FRAME

; Main loop: wait, invert, wait, invert back
main_loop:
    IKEY r14
    CMPI r14, 0
    JNZ r14, exit

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
