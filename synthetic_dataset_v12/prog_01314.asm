; DESCRIPTION: Sets a single yellow pixel at (212, 45).
; PLAN: r0=212(x), r1=45(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 212
LDI r1, 45
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
