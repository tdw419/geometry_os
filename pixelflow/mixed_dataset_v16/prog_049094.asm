; DESCRIPTION: Sets a single orange pixel at (47, 78).
; PLAN: r0=47(x), r1=78(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 47
LDI r1, 78
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
