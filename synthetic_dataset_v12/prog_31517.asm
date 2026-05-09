; DESCRIPTION: Sets a single green pixel at (287, 217).
; PLAN: r0=287(x), r1=217(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 287
LDI r1, 217
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
