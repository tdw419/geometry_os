; DESCRIPTION: Sets a single green pixel at (195, 104).
; PLAN: r0=195(x), r1=104(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 195
LDI r1, 104
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
