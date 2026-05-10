; DESCRIPTION: Draws a purple rectangle at (357, 54) with width 31 and height 106.
; PLAN: r0=357(x), r1=54(y), r2=31(width), r3=106(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 357
LDI r1, 54
LDI r2, 31
LDI r3, 106
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
