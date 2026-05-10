; DESCRIPTION: Sets a single yellow pixel at (139, 92).
; PLAN: r0=139(x), r1=92(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 139
LDI r1, 92
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
