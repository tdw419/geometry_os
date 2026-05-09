; DESCRIPTION: Sets a single orange pixel at (289, 98).
; PLAN: r0=289(x), r1=98(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 289
LDI r1, 98
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
