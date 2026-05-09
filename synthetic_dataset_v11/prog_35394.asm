; DESCRIPTION: Sets a single purple pixel at (57, 101).
; PLAN: r0=57(x), r1=101(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 57
LDI r1, 101
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
