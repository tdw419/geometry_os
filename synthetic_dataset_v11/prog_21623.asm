; DESCRIPTION: Sets a single yellow pixel at (13, 25).
; PLAN: r0=13(x), r1=25(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 13
LDI r1, 25
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
