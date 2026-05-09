; DESCRIPTION: Sets a single yellow pixel at (34, 10).
; PLAN: r0=34(x), r1=10(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 34
LDI r1, 10
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
