; DESCRIPTION: Creates a black circular shape at (76, 188) with radius 54.
; PLAN: r0=76(x), r1=188(y), r2=54(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 76
LDI r1, 188
LDI r2, 54
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
