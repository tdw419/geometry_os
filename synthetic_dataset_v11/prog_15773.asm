; DESCRIPTION: Sets a single yellow pixel at (98, 121).
; PLAN: r0=98(x), r1=121(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 98
LDI r1, 121
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
