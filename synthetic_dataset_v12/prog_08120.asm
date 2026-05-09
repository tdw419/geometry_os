; DESCRIPTION: Draws a black circle centered at (430, 156) with radius 65.
; PLAN: r0=430(x), r1=156(y), r2=65(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 430
LDI r1, 156
LDI r2, 65
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
