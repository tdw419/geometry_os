; DESCRIPTION: Draws a black circle centered at (211, 132) with radius 40.
; PLAN: r0=211(x), r1=132(y), r2=40(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 211
LDI r1, 132
LDI r2, 40
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
