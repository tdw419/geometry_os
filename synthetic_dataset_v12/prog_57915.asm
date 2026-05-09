; DESCRIPTION: Sets a single green pixel at (324, 83).
; PLAN: r0=324(x), r1=83(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 324
LDI r1, 83
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
