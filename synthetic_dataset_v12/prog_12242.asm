; DESCRIPTION: Sets a single yellow pixel at (432, 110).
; PLAN: r0=432(x), r1=110(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 432
LDI r1, 110
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
