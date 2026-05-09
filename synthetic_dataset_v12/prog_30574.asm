; DESCRIPTION: Sets a single yellow pixel at (236, 92).
; PLAN: r0=236(x), r1=92(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 236
LDI r1, 92
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
