; DESCRIPTION: Sets a single green pixel at (40, 78).
; PLAN: r0=40(x), r1=78(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 40
LDI r1, 78
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
