; DESCRIPTION: Sets a single green pixel at (194, 36).
; PLAN: r0=194(x), r1=36(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 194
LDI r1, 36
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
