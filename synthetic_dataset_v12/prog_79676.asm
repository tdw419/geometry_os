; DESCRIPTION: Sets a single purple pixel at (377, 22).
; PLAN: r0=377(x), r1=22(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 377
LDI r1, 22
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
