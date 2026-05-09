; DESCRIPTION: Draws a purple rectangle at (194, 110) with width 63 and height 70.
; PLAN: r0=194(x), r1=110(y), r2=63(width), r3=70(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 110
LDI r2, 63
LDI r3, 70
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
