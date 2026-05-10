; DESCRIPTION: Sets a single purple pixel at (22, 232).
; PLAN: r0=22(x), r1=232(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 22
LDI r1, 232
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
