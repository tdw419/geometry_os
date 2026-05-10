; DESCRIPTION: Draws a purple circle centered at (396, 110) with radius 78.
; PLAN: r0=396(x), r1=110(y), r2=78(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 396
LDI r1, 110
LDI r2, 78
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
