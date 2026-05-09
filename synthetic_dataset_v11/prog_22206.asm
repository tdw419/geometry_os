; DESCRIPTION: Sets a single orange pixel at (116, 238).
; PLAN: r0=116(x), r1=238(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 116
LDI r1, 238
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
