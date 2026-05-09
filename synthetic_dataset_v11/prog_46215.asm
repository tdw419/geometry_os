; DESCRIPTION: Sets a single green pixel at (81, 66).
; PLAN: r0=81(x), r1=66(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 81
LDI r1, 66
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
