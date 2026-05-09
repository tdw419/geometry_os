; DESCRIPTION: Sets a single yellow pixel at (221, 52).
; PLAN: r0=221(x), r1=52(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 221
LDI r1, 52
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
