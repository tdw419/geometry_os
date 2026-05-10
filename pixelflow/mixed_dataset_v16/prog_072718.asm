; DESCRIPTION: Sets a single purple pixel at (101, 52).
; PLAN: r0=101(x), r1=52(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 101
LDI r1, 52
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
