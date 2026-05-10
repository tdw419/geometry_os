; DESCRIPTION: Sets a single yellow pixel at (105, 104).
; PLAN: r0=105(x), r1=104(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 105
LDI r1, 104
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
