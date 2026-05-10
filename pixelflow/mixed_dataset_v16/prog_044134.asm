; DESCRIPTION: Sets a single yellow pixel at (498, 13).
; PLAN: r0=498(x), r1=13(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 498
LDI r1, 13
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
