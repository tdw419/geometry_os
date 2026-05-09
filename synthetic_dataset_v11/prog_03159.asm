; DESCRIPTION: Sets a single orange pixel at (190, 199).
; PLAN: r0=190(x), r1=199(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 190
LDI r1, 199
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
