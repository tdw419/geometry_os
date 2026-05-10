; DESCRIPTION: Sets a single yellow pixel at (274, 26).
; PLAN: r0=274(x), r1=26(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 274
LDI r1, 26
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
