; DESCRIPTION: Draws a black circle centered at (119, 201) with radius 14.
; PLAN: r0=119(x), r1=201(y), r2=14(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 119
LDI r1, 201
LDI r2, 14
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
