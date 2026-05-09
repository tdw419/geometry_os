; DESCRIPTION: Sets a single purple pixel at (7, 32).
; PLAN: r0=7(x), r1=32(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 7
LDI r1, 32
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
