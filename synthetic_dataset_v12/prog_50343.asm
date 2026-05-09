; DESCRIPTION: Sets a single orange pixel at (399, 2).
; PLAN: r0=399(x), r1=2(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 399
LDI r1, 2
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
