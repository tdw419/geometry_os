; DESCRIPTION: Sets a single orange pixel at (78, 105).
; PLAN: r0=78(x), r1=105(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 78
LDI r1, 105
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
