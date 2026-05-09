; DESCRIPTION: Draws a purple rectangle at (188, 155) with width 106 and height 19.
; PLAN: r0=188(x), r1=155(y), r2=106(width), r3=19(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 155
LDI r2, 106
LDI r3, 19
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
