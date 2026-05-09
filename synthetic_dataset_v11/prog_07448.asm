; DESCRIPTION: Sets a single green pixel at (109, 221).
; PLAN: r0=109(x), r1=221(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 109
LDI r1, 221
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
