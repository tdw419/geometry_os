; DESCRIPTION: Sets a single green pixel at (379, 110).
; PLAN: r0=379(x), r1=110(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 379
LDI r1, 110
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
