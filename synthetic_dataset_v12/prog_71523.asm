; DESCRIPTION: Sets a single yellow pixel at (191, 211).
; PLAN: r0=191(x), r1=211(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 191
LDI r1, 211
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
