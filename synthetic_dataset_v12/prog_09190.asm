; DESCRIPTION: Creates a green circular shape at (339, 85) with radius 66.
; PLAN: r0=339(x), r1=85(y), r2=66(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 339
LDI r1, 85
LDI r2, 66
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
