; DESCRIPTION: Draws a black circle centered at (381, 201) with radius 22.
; PLAN: r0=381(x), r1=201(y), r2=22(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 381
LDI r1, 201
LDI r2, 22
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
