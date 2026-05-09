; DESCRIPTION: Sets a single orange pixel at (100, 11).
; PLAN: r0=100(x), r1=11(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 100
LDI r1, 11
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
