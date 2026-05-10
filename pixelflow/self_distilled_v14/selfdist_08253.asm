; DESCRIPTION: Sets a single orange pixel at (351, 20).
; PLAN: r0=351(x), r1=20(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 351
LDI r1, 20
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
