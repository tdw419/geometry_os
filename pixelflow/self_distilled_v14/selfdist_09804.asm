; DESCRIPTION: Sets a single purple pixel at (293, 36).
; PLAN: r0=293(x), r1=36(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 293
LDI r1, 36
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
