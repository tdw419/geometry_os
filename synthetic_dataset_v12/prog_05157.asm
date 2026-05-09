; DESCRIPTION: Sets a single purple pixel at (181, 75).
; PLAN: r0=181(x), r1=75(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 181
LDI r1, 75
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
