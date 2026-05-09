; DESCRIPTION: Draws a purple rectangle at (254, 145) with width 109 and height 106.
; PLAN: r0=254(x), r1=145(y), r2=109(width), r3=106(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 145
LDI r2, 109
LDI r3, 106
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
