; DESCRIPTION: Creates a black circular shape at (311, 109) with radius 49.
; PLAN: r0=311(x), r1=109(y), r2=49(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 311
LDI r1, 109
LDI r2, 49
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
