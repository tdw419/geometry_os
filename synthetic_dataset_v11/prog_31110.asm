; DESCRIPTION: Sets a single purple pixel at (1, 251).
; PLAN: r0=1(x), r1=251(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 1
LDI r1, 251
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
