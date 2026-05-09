; DESCRIPTION: Draws a black circle centered at (247, 192) with radius 31.
; PLAN: r0=247(x), r1=192(y), r2=31(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 247
LDI r1, 192
LDI r2, 31
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
