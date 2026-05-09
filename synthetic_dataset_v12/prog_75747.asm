; DESCRIPTION: Sets a single green pixel at (388, 244).
; PLAN: r0=388(x), r1=244(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 388
LDI r1, 244
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
