; DESCRIPTION: Sets a single yellow pixel at (249, 139).
; PLAN: r0=249(x), r1=139(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 249
LDI r1, 139
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
