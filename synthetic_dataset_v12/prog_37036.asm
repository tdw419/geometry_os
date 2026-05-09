; DESCRIPTION: Sets a single purple pixel at (231, 251).
; PLAN: r0=231(x), r1=251(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 231
LDI r1, 251
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
