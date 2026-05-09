; DESCRIPTION: Draws a purple rectangle at (106, 78) with width 52 and height 23.
; PLAN: r0=106(x), r1=78(y), r2=52(width), r3=23(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 78
LDI r2, 52
LDI r3, 23
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
