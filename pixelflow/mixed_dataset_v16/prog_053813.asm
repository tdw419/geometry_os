; DESCRIPTION: Sets a single purple pixel at (466, 203).
; PLAN: r0=466(x), r1=203(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 466
LDI r1, 203
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
