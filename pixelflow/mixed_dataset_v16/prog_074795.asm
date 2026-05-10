; DESCRIPTION: Sets a single green pixel at (319, 168).
; PLAN: r0=319(x), r1=168(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 319
LDI r1, 168
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
