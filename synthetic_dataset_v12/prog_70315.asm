; DESCRIPTION: Creates a black circular shape at (343, 180) with radius 75.
; PLAN: r0=343(x), r1=180(y), r2=75(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 343
LDI r1, 180
LDI r2, 75
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
