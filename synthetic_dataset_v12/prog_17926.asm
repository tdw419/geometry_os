; DESCRIPTION: Draws a purple rectangle at (68, 83) with width 35 and height 107.
; PLAN: r0=68(x), r1=83(y), r2=35(width), r3=107(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 83
LDI r2, 35
LDI r3, 107
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
