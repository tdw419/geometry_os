; DESCRIPTION: Creates a black circular shape at (324, 119) with radius 69.
; PLAN: r0=324(x), r1=119(y), r2=69(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 324
LDI r1, 119
LDI r2, 69
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
