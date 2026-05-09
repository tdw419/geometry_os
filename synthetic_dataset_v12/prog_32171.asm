; DESCRIPTION: Sets a single purple pixel at (48, 77).
; PLAN: r0=48(x), r1=77(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 48
LDI r1, 77
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
