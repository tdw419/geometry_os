; DESCRIPTION: Creates a black circular shape at (334, 162) with radius 77.
; PLAN: r0=334(x), r1=162(y), r2=77(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 334
LDI r1, 162
LDI r2, 77
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
