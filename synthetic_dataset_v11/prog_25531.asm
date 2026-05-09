; DESCRIPTION: Sets a single yellow pixel at (111, 47).
; PLAN: r0=111(x), r1=47(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 111
LDI r1, 47
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
