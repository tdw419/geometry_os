; DESCRIPTION: Creates a green circular shape at (204, 76) with radius 31.
; PLAN: r0=204(x), r1=76(y), r2=31(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 204
LDI r1, 76
LDI r2, 31
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
