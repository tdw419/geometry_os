; DESCRIPTION: Sets a single purple pixel at (459, 26).
; PLAN: r0=459(x), r1=26(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 459
LDI r1, 26
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
