; DESCRIPTION: Draws a black circle centered at (137, 123) with radius 10.
; PLAN: r0=137(x), r1=123(y), r2=10(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 137
LDI r1, 123
LDI r2, 10
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
