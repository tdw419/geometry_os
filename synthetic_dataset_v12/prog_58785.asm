; DESCRIPTION: Creates a green circular shape at (382, 201) with radius 18.
; PLAN: r0=382(x), r1=201(y), r2=18(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 382
LDI r1, 201
LDI r2, 18
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
