; DESCRIPTION: Sets a single red pixel at (106, 190).
; PLAN: r0=106(x), r1=190(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 106
LDI r1, 190
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
