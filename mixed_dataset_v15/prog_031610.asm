; DESCRIPTION: Creates a red circular shape at (425, 201) with radius 36.
; PLAN: r0=425(x), r1=201(y), r2=36(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 425
LDI r1, 201
LDI r2, 36
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
