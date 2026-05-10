; DESCRIPTION: Creates a black circular shape at (51, 135) with radius 49.
; PLAN: r0=51(x), r1=135(y), r2=49(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 51
LDI r1, 135
LDI r2, 49
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
