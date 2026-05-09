; DESCRIPTION: Creates a green circular shape at (119, 155) with radius 66.
; PLAN: r0=119(x), r1=155(y), r2=66(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 119
LDI r1, 155
LDI r2, 66
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
