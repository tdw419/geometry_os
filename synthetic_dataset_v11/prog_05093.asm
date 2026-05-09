; DESCRIPTION: Draws a black circle centered at (159, 131) with radius 77.
; PLAN: r0=159(x), r1=131(y), r2=77(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 159
LDI r1, 131
LDI r2, 77
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
