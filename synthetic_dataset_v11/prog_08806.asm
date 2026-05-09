; DESCRIPTION: Draws a black circle centered at (109, 100) with radius 62.
; PLAN: r0=109(x), r1=100(y), r2=62(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 109
LDI r1, 100
LDI r2, 62
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
