; DESCRIPTION: Draws a white diagonal line from the top-left (0, 0) to the bottom-right (255, 255).%

LDI r3, 0x3000

LDI r14, 0xFFF
LDI r2, 0
LDI r9, 10
LDI r6, 0
BFE r2, r3, r6, r9

ADDI r11, 1
CMPI r11, 250
BLT r0, cr_loop

RET

croll_move:
LDI r2, 0
RET