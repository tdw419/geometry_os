; DESCRIPTION: Sets a single yellow pixel at (36, 72).
; PLAN: r0=36(x), r1=72(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 36
LDI r1, 72
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
