; DESCRIPTION: Sets a single purple pixel at (208, 4).
; PLAN: r0=208(x), r1=4(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 208
LDI r1, 4
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
