; DESCRIPTION: Sets a single yellow pixel at (92, 248).
; PLAN: r0=92(x), r1=248(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 92
LDI r1, 248
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
