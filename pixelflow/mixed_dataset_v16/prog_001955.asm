; DESCRIPTION: Sets a single yellow pixel at (322, 66).
; PLAN: r0=322(x), r1=66(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 322
LDI r1, 66
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
