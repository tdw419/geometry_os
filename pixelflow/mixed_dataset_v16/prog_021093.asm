; DESCRIPTION: Sets a single orange pixel at (417, 121).
; PLAN: r0=417(x), r1=121(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 417
LDI r1, 121
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
