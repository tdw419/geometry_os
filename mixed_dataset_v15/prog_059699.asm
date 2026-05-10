; DESCRIPTION: Sets a single yellow pixel at (361, 138).
; PLAN: r0=361(x), r1=138(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 361
LDI r1, 138
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
