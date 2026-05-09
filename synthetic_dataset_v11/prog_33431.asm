; DESCRIPTION: Sets a single blue pixel at (140, 219).
; PLAN: r0=140(x), r1=219(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 140
LDI r1, 219
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
