; DESCRIPTION: Sets a single purple pixel at (451, 56).
; PLAN: r0=451(x), r1=56(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 451
LDI r1, 56
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
