; DESCRIPTION: Draws a purple circle centered at (136, 2) with radius 56.
; PLAN: r0=136(x), r1=2(y), r2=56(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 136
LDI r1, 2
LDI r2, 56
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
