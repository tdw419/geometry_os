; DESCRIPTION: Sets a single yellow pixel at (122, 31).
; PLAN: r0=122(x), r1=31(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 122
LDI r1, 31
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
