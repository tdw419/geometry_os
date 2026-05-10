; DESCRIPTION: Sets a single orange pixel at (378, 244).
; PLAN: r0=378(x), r1=244(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 378
LDI r1, 244
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
