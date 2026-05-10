; DESCRIPTION: Sets a single green pixel at (5, 12).
; PLAN: r0=5(x), r1=12(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 5
LDI r1, 12
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
