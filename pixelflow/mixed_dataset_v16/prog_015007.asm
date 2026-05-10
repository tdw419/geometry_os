; DESCRIPTION: Creates a black circular shape at (390, 189) with radius 51.
; PLAN: r0=390(x), r1=189(y), r2=51(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 390
LDI r1, 189
LDI r2, 51
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
