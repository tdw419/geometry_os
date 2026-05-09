; DESCRIPTION: Draws a black circle centered at (88, 188) with radius 53.
; PLAN: r0=88(x), r1=188(y), r2=53(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 88
LDI r1, 188
LDI r2, 53
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
