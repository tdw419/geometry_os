; DESCRIPTION: Sets a single yellow pixel at (407, 85).
; PLAN: r0=407(x), r1=85(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 407
LDI r1, 85
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
