; DESCRIPTION: Draws a black circle centered at (457, 97) with radius 10.
; PLAN: r0=457(x), r1=97(y), r2=10(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 457
LDI r1, 97
LDI r2, 10
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
