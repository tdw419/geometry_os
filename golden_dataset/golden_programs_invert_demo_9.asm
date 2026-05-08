; DESCRIPTION: This GeOS assembly code draws colored vertical stripes on the screen and enters a loop where it inverts the display between normal and inverted states every 30 frames until any key is pressed to exit.

; invert_demo.asm -- Visual demo cycling between normal and inverted screen
; Phase 67: uses INV opcode
; Press any key to exit

; Draw colored stripes using RECTF
LDI r0, 0
LDI r8, 0
LDI r10, 256
LDI r9, 42
LDI r2, 0x00FF0000
RECTF r0, r8, r10, r9, r2

LDI r8, 42
LDI r2, 0x0000FF00
RECTF r0, r8, r10, r9, r2

LDI r8, 84
LDI r2, 0x000000FF
RECTF r0, r8, r10, r9, r2

LDI r8, 126
LDI r2, 0x00FFFF00
RECTF r0, r8, r10, r9, r2

LDI r8, 168
LDI r2, 0x00FF00FF
RECTF r0, r8, r10, r9, r2

LDI r8, 210
LDI r9, 46
LDI r2, 0x0000FFFF
RECTF r0, r8, r10, r9, r2

FRAME

; Main loop: wait, invert, wait, invert back
main_loop:
    IKEY r0
    CMPI r0, 0
    JNZ r0, exit

    LDI r12, 30
wait1:
    FRAME
    SUBI r12, 1
    JNZ r12, wait1

    INV
    FRAME

    LDI r12, 30
wait2:
    FRAME
    SUBI r12, 1
    JNZ r12, wait2

    INV
    FRAME

    JNZ r21, main_loop

exit:
    HALT
