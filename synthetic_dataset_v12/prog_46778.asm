; DESCRIPTION: Sets a single yellow pixel at (475, 34).
; PLAN: r0=475(x), r1=34(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 475
LDI r1, 34
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
