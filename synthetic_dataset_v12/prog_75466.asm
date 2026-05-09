; DESCRIPTION: Sets a single green pixel at (183, 255).
; PLAN: r0=183(x), r1=255(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 183
LDI r1, 255
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
