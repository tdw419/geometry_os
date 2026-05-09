; DESCRIPTION: Draws a purple circle centered at (250, 158) with radius 78.
; PLAN: r0=250(x), r1=158(y), r2=78(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 250
LDI r1, 158
LDI r2, 78
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
