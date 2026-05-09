; DESCRIPTION: Sets a single green pixel at (83, 81).
; PLAN: r0=83(x), r1=81(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 83
LDI r1, 81
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
