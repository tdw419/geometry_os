; DESCRIPTION: Sets a single purple pixel at (238, 73).
; PLAN: r0=238(x), r1=73(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 238
LDI r1, 73
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
