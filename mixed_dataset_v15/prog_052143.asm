; DESCRIPTION: Draws a black circle centered at (399, 53) with radius 44.
; PLAN: r0=399(x), r1=53(y), r2=44(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 399
LDI r1, 53
LDI r2, 44
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
