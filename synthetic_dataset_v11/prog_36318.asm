; DESCRIPTION: Draws a black circle centered at (76, 199) with radius 26.
; PLAN: r0=76(x), r1=199(y), r2=26(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 76
LDI r1, 199
LDI r2, 26
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
