; DESCRIPTION: Sets a single green pixel at (30, 104).
; PLAN: r0=30(x), r1=104(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 30
LDI r1, 104
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
