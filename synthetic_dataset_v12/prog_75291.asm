; DESCRIPTION: Sets a single blue pixel at (417, 156).
; PLAN: r0=417(x), r1=156(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 417
LDI r1, 156
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
