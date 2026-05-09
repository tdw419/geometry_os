; DESCRIPTION: Sets a single purple pixel at (226, 191).
; PLAN: r0=226(x), r1=191(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 226
LDI r1, 191
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
