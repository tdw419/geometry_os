; DESCRIPTION: Sets a single yellow pixel at (94, 118).
; PLAN: r0=94(x), r1=118(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 94
LDI r1, 118
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
