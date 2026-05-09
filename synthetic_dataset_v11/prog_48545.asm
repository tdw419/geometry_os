; DESCRIPTION: Sets a single orange pixel at (58, 10).
; PLAN: r0=58(x), r1=10(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 58
LDI r1, 10
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
