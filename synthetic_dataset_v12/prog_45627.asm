; DESCRIPTION: Sets a single blue pixel at (467, 191).
; PLAN: r0=467(x), r1=191(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 467
LDI r1, 191
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
