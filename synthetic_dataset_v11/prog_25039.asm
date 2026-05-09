; DESCRIPTION: Sets a single yellow pixel at (52, 62).
; PLAN: r0=52(x), r1=62(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 52
LDI r1, 62
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
