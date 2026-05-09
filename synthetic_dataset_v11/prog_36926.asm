; DESCRIPTION: Sets a single purple pixel at (217, 205).
; PLAN: r0=217(x), r1=205(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 217
LDI r1, 205
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
