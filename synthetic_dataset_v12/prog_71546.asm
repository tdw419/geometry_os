; DESCRIPTION: Sets a single green pixel at (145, 31).
; PLAN: r0=145(x), r1=31(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 145
LDI r1, 31
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
