; DESCRIPTION: Sets a single purple pixel at (107, 49).
; PLAN: r0=107(x), r1=49(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 107
LDI r1, 49
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
