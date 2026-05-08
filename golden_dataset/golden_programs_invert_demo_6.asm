; DESCRIPTION: Display a object using color red at the screen.

; invert_demo.asm -- Visual demo cycling between normal and inverted screen
; Phase 67: uses INV opcode
; Press any key to exit

; Draw colored stripes using RECTF
LDI r10, 0
LDI r13, 0
LDI r14, 256
LDI r7, 42
LDI r8, 0x00FF0000
RECTF r10, r13, r14, r7, r8

LDI r13, 42
LDI r8, 0x0000FF00
RECTF r10, r13, r14, r7, r8

LDI r13, 84
LDI r8, 0x000000FF
RECTF r10, r13, r14, r7, r8

LDI r13, 126
LDI r8, 0x00FFFF00
RECTF r10, r13, r14, r7, r8

LDI r13, 168
LDI r8, 0x00FF00FF
RECTF r10, r13, r14, r7, r8

LDI r13, 210
LDI r7, 46
LDI r8, 0x0000FFFF
RECTF r10, r13, r14, r7, r8

FRAME

; Main loop: wait, invert, wait, invert back
main_loop:
    IKEY r10
    CMPI r10, 0
    JNZ r10, exit

    LDI r9, 30
wait1:
    FRAME
    SUBI r9, 1
    JNZ r9, wait1

    INV
    FRAME

    LDI r9, 30
wait2:
    FRAME
    SUBI r9, 1
    JNZ r9, wait2

    INV
    FRAME

    JNZ r21, main_loop

exit:
    HALT
