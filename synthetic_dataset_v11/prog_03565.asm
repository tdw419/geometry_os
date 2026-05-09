; DESCRIPTION: Sets a single white pixel at (143, 190).
; PLAN: r0=143(x), r1=190(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 143
LDI r1, 190
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
