; DESCRIPTION: Sets a single blue pixel at (256, 87).
; PLAN: r0=256(x), r1=87(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 256
LDI r1, 87
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
