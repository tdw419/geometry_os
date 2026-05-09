; DESCRIPTION: Draws a black circle centered at (77, 137) with radius 68.
; PLAN: r0=77(x), r1=137(y), r2=68(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 77
LDI r1, 137
LDI r2, 68
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
