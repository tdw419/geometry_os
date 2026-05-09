; DESCRIPTION: Sets a single purple pixel at (185, 245).
; PLAN: r0=185(x), r1=245(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 185
LDI r1, 245
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
