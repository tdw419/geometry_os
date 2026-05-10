; DESCRIPTION: Sets a single blue pixel at (417, 216).
; PLAN: r0=417(x), r1=216(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 417
LDI r1, 216
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
