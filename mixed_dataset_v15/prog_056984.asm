; DESCRIPTION: Draws a purple circle centered at (421, 148) with radius 80.
; PLAN: r0=421(x), r1=148(y), r2=80(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 421
LDI r1, 148
LDI r2, 80
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
