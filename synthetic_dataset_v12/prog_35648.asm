; DESCRIPTION: Sets a single blue pixel at (419, 149).
; PLAN: r0=419(x), r1=149(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 419
LDI r1, 149
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
