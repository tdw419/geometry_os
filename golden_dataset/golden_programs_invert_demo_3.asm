; DESCRIPTION: Draws a red object at the screen with fixed size.

; invert_demo.asm -- Visual demo cycling between normal and inverted screen
; Phase 67: uses INV opcode
; Press any key to exit

; Draw colored stripes using RECTF
LDI r14, 0
LDI r1, 0
LDI r10, 256
LDI r8, 42
LDI r9, 0x00FF0000
RECTF r14, r1, r10, r8, r9

LDI r1, 42
LDI r9, 0x0000FF00
RECTF r14, r1, r10, r8, r9

LDI r1, 84
LDI r9, 0x000000FF
RECTF r14, r1, r10, r8, r9

LDI r1, 126
LDI r9, 0x00FFFF00
RECTF r14, r1, r10, r8, r9

LDI r1, 168
LDI r9, 0x00FF00FF
RECTF r14, r1, r10, r8, r9

LDI r1, 210
LDI r8, 46
LDI r9, 0x0000FFFF
RECTF r14, r1, r10, r8, r9

FRAME

; Main loop: wait, invert, wait, invert back
main_loop:
    IKEY r14
    CMPI r14, 0
    JNZ r14, exit

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
