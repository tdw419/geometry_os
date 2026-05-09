; DESCRIPTION: Sets a single yellow pixel at (62, 43).
; PLAN: r0=62(x), r1=43(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 62
LDI r1, 43
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
