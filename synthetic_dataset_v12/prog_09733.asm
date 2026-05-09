; DESCRIPTION: Draws a black circle centered at (159, 54) with radius 26.
; PLAN: r0=159(x), r1=54(y), r2=26(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 159
LDI r1, 54
LDI r2, 26
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
