; DESCRIPTION: This GeOS assembly code draws colored vertical stripes on the screen and enters a loop where it inverts the display between normal and inverted states every 30 frames until any key is pressed to exit.

; invert_demo.asm -- Visual demo cycling between normal and inverted screen
; Phase 67: uses INV opcode
; Press any key to exit

; Draw colored stripes using RECTF
LDI r14, 0
LDI r0, 0
LDI r3, 256
LDI r7, 42
LDI r5, 0x00FF0000
RECTF r14, r0, r3, r7, r5

LDI r0, 42
LDI r5, 0x0000FF00
RECTF r14, r0, r3, r7, r5

LDI r0, 84
LDI r5, 0x000000FF
RECTF r14, r0, r3, r7, r5

LDI r0, 126
LDI r5, 0x00FFFF00
RECTF r14, r0, r3, r7, r5

LDI r0, 168
LDI r5, 0x00FF00FF
RECTF r14, r0, r3, r7, r5

LDI r0, 210
LDI r7, 46
LDI r5, 0x0000FFFF
RECTF r14, r0, r3, r7, r5

FRAME

; Main loop: wait, invert, wait, invert back
main_loop:
    IKEY r14
    CMPI r14, 0
    JNZ r14, exit

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
