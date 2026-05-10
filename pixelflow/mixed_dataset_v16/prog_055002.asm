; DESCRIPTION: Sets a single yellow pixel at (364, 129).
; PLAN: r0=364(x), r1=129(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 364
LDI r1, 129
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
