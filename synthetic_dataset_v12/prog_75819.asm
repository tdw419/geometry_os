; DESCRIPTION: Creates a green circular shape at (71, 201) with radius 35.
; PLAN: r0=71(x), r1=201(y), r2=35(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 71
LDI r1, 201
LDI r2, 35
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
