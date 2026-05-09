; DESCRIPTION: Sets a single green pixel at (364, 201).
; PLAN: r0=364(x), r1=201(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 364
LDI r1, 201
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
