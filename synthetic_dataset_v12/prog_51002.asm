; DESCRIPTION: Sets a single purple pixel at (90, 185).
; PLAN: r0=90(x), r1=185(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 90
LDI r1, 185
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
