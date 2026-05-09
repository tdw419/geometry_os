; DESCRIPTION: Creates a orange circular shape at (204, 201) with radius 13.
; PLAN: r0=204(x), r1=201(y), r2=13(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 204
LDI r1, 201
LDI r2, 13
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
