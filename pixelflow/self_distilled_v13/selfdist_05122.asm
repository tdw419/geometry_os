; DESCRIPTION: Sets a single purple pixel at (72, 61).
; PLAN: r0=72(x), r1=61(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 72
LDI r1, 61
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
