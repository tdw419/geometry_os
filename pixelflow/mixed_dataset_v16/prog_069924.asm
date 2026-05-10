; DESCRIPTION: Draws a purple circle centered at (253, 80) with radius 62.
; PLAN: r0=253(x), r1=80(y), r2=62(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 253
LDI r1, 80
LDI r2, 62
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
