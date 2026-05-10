; DESCRIPTION: Sets a single yellow pixel at (1, 20).
; PLAN: r0=1(x), r1=20(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 1
LDI r1, 20
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
