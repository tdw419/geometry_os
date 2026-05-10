; DESCRIPTION: Sets a single purple pixel at (182, 87).
; PLAN: r0=182(x), r1=87(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 182
LDI r1, 87
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
