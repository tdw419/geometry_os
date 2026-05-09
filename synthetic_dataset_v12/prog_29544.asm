; DESCRIPTION: Sets a single yellow pixel at (460, 247).
; PLAN: r0=460(x), r1=247(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 460
LDI r1, 247
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
