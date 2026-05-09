; DESCRIPTION: Creates a red circular shape at (99, 201) with radius 44.
; PLAN: r0=99(x), r1=201(y), r2=44(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 99
LDI r1, 201
LDI r2, 44
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
