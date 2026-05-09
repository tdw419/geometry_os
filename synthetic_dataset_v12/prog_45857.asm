; DESCRIPTION: Sets a single orange pixel at (204, 34).
; PLAN: r0=204(x), r1=34(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 204
LDI r1, 34
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
