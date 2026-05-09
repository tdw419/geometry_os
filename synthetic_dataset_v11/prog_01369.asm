; DESCRIPTION: Draws a black circle centered at (166, 22) with radius 18.
; PLAN: r0=166(x), r1=22(y), r2=18(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 166
LDI r1, 22
LDI r2, 18
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
