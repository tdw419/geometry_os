; DESCRIPTION: Creates a black circular shape at (100, 179) with radius 74.
; PLAN: r0=100(x), r1=179(y), r2=74(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 100
LDI r1, 179
LDI r2, 74
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
