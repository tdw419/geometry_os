; DESCRIPTION: Creates a green circular shape at (109, 227) with radius 12.
; PLAN: r0=109(x), r1=227(y), r2=12(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 109
LDI r1, 227
LDI r2, 12
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
