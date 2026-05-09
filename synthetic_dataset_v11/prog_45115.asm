; DESCRIPTION: Sets a single green pixel at (163, 170).
; PLAN: r0=163(x), r1=170(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 163
LDI r1, 170
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
