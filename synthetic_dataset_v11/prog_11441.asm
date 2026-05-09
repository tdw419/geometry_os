; DESCRIPTION: Creates a black circular shape at (139, 134) with radius 22.
; PLAN: r0=139(x), r1=134(y), r2=22(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 139
LDI r1, 134
LDI r2, 22
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
