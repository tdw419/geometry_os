; DESCRIPTION: Sets a single purple pixel at (419, 144).
; PLAN: r0=419(x), r1=144(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 419
LDI r1, 144
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
