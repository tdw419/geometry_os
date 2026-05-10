; DESCRIPTION: Sets a single yellow pixel at (4, 100).
; PLAN: r0=4(x), r1=100(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 4
LDI r1, 100
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
