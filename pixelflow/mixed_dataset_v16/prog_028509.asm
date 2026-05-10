; DESCRIPTION: Draws a black circle centered at (33, 227) with radius 23.
; PLAN: r0=33(x), r1=227(y), r2=23(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 33
LDI r1, 227
LDI r2, 23
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
