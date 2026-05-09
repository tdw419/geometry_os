; DESCRIPTION: Draws a purple circle centered at (421, 90) with radius 74.
; PLAN: r0=421(x), r1=90(y), r2=74(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 421
LDI r1, 90
LDI r2, 74
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
