; DESCRIPTION: Sets a single purple pixel at (60, 185).
; PLAN: r0=60(x), r1=185(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 60
LDI r1, 185
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
