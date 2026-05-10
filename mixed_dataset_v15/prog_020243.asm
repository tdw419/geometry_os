; DESCRIPTION: Draws a black circle centered at (249, 156) with radius 29.
; PLAN: r0=249(x), r1=156(y), r2=29(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 249
LDI r1, 156
LDI r2, 29
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
