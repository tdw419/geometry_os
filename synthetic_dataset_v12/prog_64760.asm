; DESCRIPTION: Sets a single green pixel at (430, 93).
; PLAN: r0=430(x), r1=93(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 430
LDI r1, 93
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
