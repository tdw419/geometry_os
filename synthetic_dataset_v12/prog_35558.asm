; DESCRIPTION: Creates a black circular shape at (456, 85) with radius 37.
; PLAN: r0=456(x), r1=85(y), r2=37(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 456
LDI r1, 85
LDI r2, 37
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
