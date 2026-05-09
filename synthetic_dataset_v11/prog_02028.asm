; DESCRIPTION: Sets a single green pixel at (2, 4).
; PLAN: r0=2(x), r1=4(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 2
LDI r1, 4
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
