; DESCRIPTION: Draws a purple circle centered at (453, 157) with radius 44.
; PLAN: r0=453(x), r1=157(y), r2=44(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 453
LDI r1, 157
LDI r2, 44
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
