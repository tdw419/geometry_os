; DESCRIPTION: Sets a single orange pixel at (245, 9).
; PLAN: r0=245(x), r1=9(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 245
LDI r1, 9
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
