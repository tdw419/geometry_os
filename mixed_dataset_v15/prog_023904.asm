; DESCRIPTION: Sets a single blue pixel at (324, 18).
; PLAN: r0=324(x), r1=18(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 324
LDI r1, 18
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
