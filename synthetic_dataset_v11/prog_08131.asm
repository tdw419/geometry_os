; DESCRIPTION: Sets a single white pixel at (20, 201).
; PLAN: r0=20(x), r1=201(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 20
LDI r1, 201
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
