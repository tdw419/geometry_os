; DESCRIPTION: Sets a single green pixel at (36, 114).
; PLAN: r0=36(x), r1=114(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 36
LDI r1, 114
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
