; DESCRIPTION: Sets a single green pixel at (325, 2).
; PLAN: r0=325(x), r1=2(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 325
LDI r1, 2
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
