; DESCRIPTION: Sets a single yellow pixel at (504, 153).
; PLAN: r0=504(x), r1=153(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 504
LDI r1, 153
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
