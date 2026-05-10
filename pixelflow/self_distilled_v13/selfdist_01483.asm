; DESCRIPTION: Sets a single purple pixel at (119, 73).
; PLAN: r0=119(x), r1=73(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 119
LDI r1, 73
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
