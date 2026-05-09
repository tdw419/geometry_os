; DESCRIPTION: Creates a white circular shape at (204, 48) with radius 33.
; PLAN: r0=204(x), r1=48(y), r2=33(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 204
LDI r1, 48
LDI r2, 33
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
