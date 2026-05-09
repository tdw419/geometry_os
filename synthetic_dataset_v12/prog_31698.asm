; DESCRIPTION: Draws a purple circle centered at (227, 148) with radius 78.
; PLAN: r0=227(x), r1=148(y), r2=78(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 227
LDI r1, 148
LDI r2, 78
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
