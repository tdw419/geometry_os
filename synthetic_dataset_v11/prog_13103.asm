; DESCRIPTION: Draws a blue circle centered at (118, 85) with radius 26.
; PLAN: r0=118(x), r1=85(y), r2=26(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 118
LDI r1, 85
LDI r2, 26
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
