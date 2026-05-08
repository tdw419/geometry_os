; DESCRIPTION: Geometry OS program to draw a red object.

; invert_demo.asm -- Visual demo cycling between normal and inverted screen
; Phase 67: uses INV opcode
; Press any key to exit

; Draw colored stripes using RECTF
LDI r2, 0
LDI r4, 0
LDI r6, 256
LDI r12, 42
LDI r1, 0x00FF0000
RECTF r2, r4, r6, r12, r1

LDI r4, 42
LDI r1, 0x0000FF00
RECTF r2, r4, r6, r12, r1

LDI r4, 84
LDI r1, 0x000000FF
RECTF r2, r4, r6, r12, r1

LDI r4, 126
LDI r1, 0x00FFFF00
RECTF r2, r4, r6, r12, r1

LDI r4, 168
LDI r1, 0x00FF00FF
RECTF r2, r4, r6, r12, r1

LDI r4, 210
LDI r12, 46
LDI r1, 0x0000FFFF
RECTF r2, r4, r6, r12, r1

FRAME

; Main loop: wait, invert, wait, invert back
main_loop:
    IKEY r2
    CMPI r2, 0
    JNZ r2, exit

    LDI r15, 30
wait1:
    FRAME
    SUBI r15, 1
    JNZ r15, wait1

    INV
    FRAME

    LDI r15, 30
wait2:
    FRAME
    SUBI r15, 1
    JNZ r15, wait2

    INV
    FRAME

    JNZ r21, main_loop

exit:
    HALT
