; DESCRIPTION: Sets a single yellow pixel at (420, 58).
; PLAN: r0=420(x), r1=58(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 420
LDI r1, 58
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
