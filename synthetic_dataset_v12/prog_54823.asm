; DESCRIPTION: Creates a black circular shape at (258, 122) with radius 66.
; PLAN: r0=258(x), r1=122(y), r2=66(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 258
LDI r1, 122
LDI r2, 66
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
