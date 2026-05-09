; DESCRIPTION: Draws a purple rectangle at (390, 104) with width 28 and height 105.
; PLAN: r0=390(x), r1=104(y), r2=28(width), r3=105(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 390
LDI r1, 104
LDI r2, 28
LDI r3, 105
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
