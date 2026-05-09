; DESCRIPTION: Creates a black circular shape at (115, 110) with radius 73.
; PLAN: r0=115(x), r1=110(y), r2=73(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 115
LDI r1, 110
LDI r2, 73
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
