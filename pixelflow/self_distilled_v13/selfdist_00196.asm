; DESCRIPTION: Sets a single yellow pixel at (334, 104).
; PLAN: r0=334(x), r1=104(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 334
LDI r1, 104
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
