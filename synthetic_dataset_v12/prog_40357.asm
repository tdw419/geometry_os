; DESCRIPTION: Sets a single purple pixel at (144, 107).
; PLAN: r0=144(x), r1=107(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 144
LDI r1, 107
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
