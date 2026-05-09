; DESCRIPTION: Draws a black circle centered at (471, 131) with radius 15.
; PLAN: r0=471(x), r1=131(y), r2=15(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 471
LDI r1, 131
LDI r2, 15
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
