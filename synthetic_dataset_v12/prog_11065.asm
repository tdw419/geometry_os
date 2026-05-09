; DESCRIPTION: Sets a single purple pixel at (448, 183).
; PLAN: r0=448(x), r1=183(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 448
LDI r1, 183
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
