; DESCRIPTION: Sets a single purple pixel at (10, 176).
; PLAN: r0=10(x), r1=176(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 10
LDI r1, 176
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
