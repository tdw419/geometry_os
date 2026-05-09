; DESCRIPTION: Draws a black circle centered at (159, 156) with radius 58.
; PLAN: r0=159(x), r1=156(y), r2=58(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 159
LDI r1, 156
LDI r2, 58
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
