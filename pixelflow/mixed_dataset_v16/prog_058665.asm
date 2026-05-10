; DESCRIPTION: Sets a single purple pixel at (67, 97).
; PLAN: r0=67(x), r1=97(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 67
LDI r1, 97
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
