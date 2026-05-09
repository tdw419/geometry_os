; DESCRIPTION: Sets a single yellow pixel at (339, 156).
; PLAN: r0=339(x), r1=156(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 339
LDI r1, 156
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
