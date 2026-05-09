; DESCRIPTION: Sets a single green pixel at (190, 126).
; PLAN: r0=190(x), r1=126(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 190
LDI r1, 126
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
