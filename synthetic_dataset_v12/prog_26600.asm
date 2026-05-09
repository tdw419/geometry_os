; DESCRIPTION: Sets a single green pixel at (44, 254).
; PLAN: r0=44(x), r1=254(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 44
LDI r1, 254
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
