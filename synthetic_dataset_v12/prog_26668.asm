; DESCRIPTION: Draws a purple rectangle at (132, 132) with width 62 and height 15.
; PLAN: r0=132(x), r1=132(y), r2=62(width), r3=15(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 132
LDI r2, 62
LDI r3, 15
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
