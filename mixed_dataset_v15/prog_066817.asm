; DESCRIPTION: Sets a single yellow pixel at (29, 78).
; PLAN: r0=29(x), r1=78(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 29
LDI r1, 78
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
