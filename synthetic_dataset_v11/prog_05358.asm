; DESCRIPTION: Draws a purple rectangle at (20, 37) with width 94 and height 29.
; PLAN: r0=20(x), r1=37(y), r2=94(width), r3=29(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 37
LDI r2, 94
LDI r3, 29
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
