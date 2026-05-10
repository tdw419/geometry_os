; DESCRIPTION: Sets a single yellow pixel at (106, 129).
; PLAN: r0=106(x), r1=129(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 106
LDI r1, 129
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
