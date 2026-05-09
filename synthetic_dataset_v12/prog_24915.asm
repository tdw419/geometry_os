; DESCRIPTION: Sets a single yellow pixel at (437, 229).
; PLAN: r0=437(x), r1=229(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 437
LDI r1, 229
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
