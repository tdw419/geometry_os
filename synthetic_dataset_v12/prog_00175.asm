; DESCRIPTION: Sets a single yellow pixel at (23, 25).
; PLAN: r0=23(x), r1=25(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 23
LDI r1, 25
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
