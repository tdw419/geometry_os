; DESCRIPTION: Sets a single blue pixel at (15, 98).
; PLAN: r0=15(x), r1=98(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 15
LDI r1, 98
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
