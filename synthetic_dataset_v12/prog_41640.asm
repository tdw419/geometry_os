; DESCRIPTION: Sets a single yellow pixel at (188, 201).
; PLAN: r0=188(x), r1=201(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 188
LDI r1, 201
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
