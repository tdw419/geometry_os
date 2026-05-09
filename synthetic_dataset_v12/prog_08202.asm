; DESCRIPTION: Sets a single purple pixel at (37, 107).
; PLAN: r0=37(x), r1=107(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 37
LDI r1, 107
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
