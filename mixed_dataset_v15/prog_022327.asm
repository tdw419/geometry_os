; DESCRIPTION: Sets a single blue pixel at (39, 145).
; PLAN: r0=39(x), r1=145(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 39
LDI r1, 145
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
