; DESCRIPTION: Creates a black circular shape at (437, 85) with radius 60.
; PLAN: r0=437(x), r1=85(y), r2=60(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 437
LDI r1, 85
LDI r2, 60
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
