; DESCRIPTION: Creates a black circular shape at (51, 25) with radius 23.
; PLAN: r0=51(x), r1=25(y), r2=23(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 51
LDI r1, 25
LDI r2, 23
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
