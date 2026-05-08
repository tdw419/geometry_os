; DESCRIPTION: Render a red object at the screen.

; invert_demo.asm -- Visual demo cycling between normal and inverted screen
; Phase 67: uses INV opcode
; Press any key to exit

; Draw colored stripes using RECTF
LDI r3, 0
LDI r4, 0
LDI r13, 256
LDI r12, 42
LDI r5, 0x00FF0000
RECTF r3, r4, r13, r12, r5

LDI r4, 42
LDI r5, 0x0000FF00
RECTF r3, r4, r13, r12, r5

LDI r4, 84
LDI r5, 0x000000FF
RECTF r3, r4, r13, r12, r5

LDI r4, 126
LDI r5, 0x00FFFF00
RECTF r3, r4, r13, r12, r5

LDI r4, 168
LDI r5, 0x00FF00FF
RECTF r3, r4, r13, r12, r5

LDI r4, 210
LDI r12, 46
LDI r5, 0x0000FFFF
RECTF r3, r4, r13, r12, r5

FRAME

; Main loop: wait, invert, wait, invert back
main_loop:
    IKEY r3
    CMPI r3, 0
    JNZ r3, exit

    LDI r10, 30
wait1:
    FRAME
    SUBI r10, 1
    JNZ r10, wait1

    INV
    FRAME

    LDI r10, 30
wait2:
    FRAME
    SUBI r10, 1
    JNZ r10, wait2

    INV
    FRAME

    JNZ r21, main_loop

exit:
    HALT
