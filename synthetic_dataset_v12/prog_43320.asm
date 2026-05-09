; DESCRIPTION: Sets a single yellow pixel at (131, 18).
; PLAN: r0=131(x), r1=18(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 131
LDI r1, 18
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
