; DESCRIPTION: Sets a single yellow pixel at (265, 118).
; PLAN: r0=265(x), r1=118(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 265
LDI r1, 118
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
