; DESCRIPTION: Sets a single orange pixel at (19, 58).
; PLAN: r0=19(x), r1=58(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 19
LDI r1, 58
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
