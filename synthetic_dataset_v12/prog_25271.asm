; DESCRIPTION: Sets a single yellow pixel at (141, 190).
; PLAN: r0=141(x), r1=190(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 141
LDI r1, 190
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
