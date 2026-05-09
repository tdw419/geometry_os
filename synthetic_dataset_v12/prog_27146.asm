; DESCRIPTION: Sets a single orange pixel at (21, 81).
; PLAN: r0=21(x), r1=81(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 21
LDI r1, 81
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
