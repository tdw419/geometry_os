; DESCRIPTION: Sets a single green pixel at (103, 190).
; PLAN: r0=103(x), r1=190(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 103
LDI r1, 190
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
