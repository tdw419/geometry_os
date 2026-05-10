; DESCRIPTION: Draws a black circle centered at (244, 167) with radius 58.
; PLAN: r0=244(x), r1=167(y), r2=58(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 244
LDI r1, 167
LDI r2, 58
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
