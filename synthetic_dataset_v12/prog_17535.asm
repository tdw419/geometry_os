; DESCRIPTION: Draws a black circle centered at (351, 172) with radius 54.
; PLAN: r0=351(x), r1=172(y), r2=54(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 351
LDI r1, 172
LDI r2, 54
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
