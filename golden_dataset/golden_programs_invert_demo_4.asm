; DESCRIPTION: Draw object: pos=the screen, color=red, size=fixed size.

; invert_demo.asm -- Visual demo cycling between normal and inverted screen
; Phase 67: uses INV opcode
; Press any key to exit

; Draw colored stripes using RECTF
LDI r6, 0
LDI r8, 0
LDI r9, 256
LDI r14, 42
LDI r3, 0x00FF0000
RECTF r6, r8, r9, r14, r3

LDI r8, 42
LDI r3, 0x0000FF00
RECTF r6, r8, r9, r14, r3

LDI r8, 84
LDI r3, 0x000000FF
RECTF r6, r8, r9, r14, r3

LDI r8, 126
LDI r3, 0x00FFFF00
RECTF r6, r8, r9, r14, r3

LDI r8, 168
LDI r3, 0x00FF00FF
RECTF r6, r8, r9, r14, r3

LDI r8, 210
LDI r14, 46
LDI r3, 0x0000FFFF
RECTF r6, r8, r9, r14, r3

FRAME

; Main loop: wait, invert, wait, invert back
main_loop:
    IKEY r6
    CMPI r6, 0
    JNZ r6, exit

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
