; DESCRIPTION: Creates a black circular shape at (49, 194) with radius 34.
; PLAN: r0=49(x), r1=194(y), r2=34(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 49
LDI r1, 194
LDI r2, 34
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
