; DESCRIPTION: Creates a green circular shape at (204, 48) with radius 26.
; PLAN: r0=204(x), r1=48(y), r2=26(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 204
LDI r1, 48
LDI r2, 26
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
