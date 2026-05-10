; DESCRIPTION: Sets a single orange pixel at (4, 116).
; PLAN: r0=4(x), r1=116(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 4
LDI r1, 116
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
