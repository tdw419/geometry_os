; DESCRIPTION: Sets a single yellow pixel at (83, 193).
; PLAN: r0=83(x), r1=193(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 83
LDI r1, 193
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
