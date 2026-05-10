; DESCRIPTION: Sets a single purple pixel at (74, 15).
; PLAN: r0=74(x), r1=15(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 74
LDI r1, 15
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
