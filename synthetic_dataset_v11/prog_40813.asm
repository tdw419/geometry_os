; DESCRIPTION: Sets a single purple pixel at (245, 79).
; PLAN: r0=245(x), r1=79(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 245
LDI r1, 79
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
