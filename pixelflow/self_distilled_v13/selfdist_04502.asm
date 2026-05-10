; DESCRIPTION: Sets a single green pixel at (179, 21).
; PLAN: r0=179(x), r1=21(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 179
LDI r1, 21
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
