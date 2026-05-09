; DESCRIPTION: Sets a single yellow pixel at (6, 170).
; PLAN: r0=6(x), r1=170(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 6
LDI r1, 170
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
