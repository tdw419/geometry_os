; DESCRIPTION: Sets a single orange pixel at (81, 139).
; PLAN: r0=81(x), r1=139(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 81
LDI r1, 139
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
