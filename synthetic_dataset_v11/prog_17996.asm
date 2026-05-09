; DESCRIPTION: Sets a single yellow pixel at (106, 5).
; PLAN: r0=106(x), r1=5(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 106
LDI r1, 5
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
