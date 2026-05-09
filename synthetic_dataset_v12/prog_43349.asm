; DESCRIPTION: Sets a single green pixel at (232, 189).
; PLAN: r0=232(x), r1=189(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 232
LDI r1, 189
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
