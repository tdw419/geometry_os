; DESCRIPTION: Sets a single purple pixel at (441, 94).
; PLAN: r0=441(x), r1=94(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 441
LDI r1, 94
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
