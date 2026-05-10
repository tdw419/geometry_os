; DESCRIPTION: Sets a single green pixel at (14, 71).
; PLAN: r0=14(x), r1=71(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 14
LDI r1, 71
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
