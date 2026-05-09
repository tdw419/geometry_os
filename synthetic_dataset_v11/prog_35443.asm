; DESCRIPTION: Draws a black circle centered at (189, 156) with radius 39.
; PLAN: r0=189(x), r1=156(y), r2=39(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 189
LDI r1, 156
LDI r2, 39
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
