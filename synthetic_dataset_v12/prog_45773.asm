; DESCRIPTION: Sets a single green pixel at (62, 157).
; PLAN: r0=62(x), r1=157(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 62
LDI r1, 157
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
