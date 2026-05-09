; DESCRIPTION: Sets a single purple pixel at (275, 11).
; PLAN: r0=275(x), r1=11(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 275
LDI r1, 11
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
