; DESCRIPTION: Sets a single yellow pixel at (458, 160).
; PLAN: r0=458(x), r1=160(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 458
LDI r1, 160
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
