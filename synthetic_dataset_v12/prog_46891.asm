; DESCRIPTION: Creates a red circular shape at (172, 201) with radius 29.
; PLAN: r0=172(x), r1=201(y), r2=29(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 172
LDI r1, 201
LDI r2, 29
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
