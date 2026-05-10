; DESCRIPTION: Sets a single purple pixel at (381, 194).
; PLAN: r0=381(x), r1=194(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 381
LDI r1, 194
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
