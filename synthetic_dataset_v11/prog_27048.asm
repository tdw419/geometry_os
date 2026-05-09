; DESCRIPTION: Sets a single purple pixel at (213, 201).
; PLAN: r0=213(x), r1=201(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 213
LDI r1, 201
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
