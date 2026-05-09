; DESCRIPTION: Draws a purple circle centered at (118, 144) with radius 78.
; PLAN: r0=118(x), r1=144(y), r2=78(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 118
LDI r1, 144
LDI r2, 78
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
