; DESCRIPTION: Draws a black circle centered at (181, 51) with radius 37.
; PLAN: r0=181(x), r1=51(y), r2=37(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 181
LDI r1, 51
LDI r2, 37
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
