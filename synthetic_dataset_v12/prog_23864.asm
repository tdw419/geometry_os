; DESCRIPTION: Sets a single yellow pixel at (109, 115).
; PLAN: r0=109(x), r1=115(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 109
LDI r1, 115
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
