; DESCRIPTION: Sets a single orange pixel at (232, 232).
; PLAN: r0=232(x), r1=232(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 232
LDI r1, 232
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
