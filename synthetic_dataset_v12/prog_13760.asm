; DESCRIPTION: Sets a single green pixel at (26, 74).
; PLAN: r0=26(x), r1=74(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 26
LDI r1, 74
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
