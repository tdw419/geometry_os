; DESCRIPTION: Sets a single blue pixel at (451, 118).
; PLAN: r0=451(x), r1=118(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 451
LDI r1, 118
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
