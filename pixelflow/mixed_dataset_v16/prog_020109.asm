; DESCRIPTION: Sets a single orange pixel at (241, 17).
; PLAN: r0=241(x), r1=17(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 241
LDI r1, 17
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
