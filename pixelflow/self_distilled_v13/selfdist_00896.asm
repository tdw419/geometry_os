; DESCRIPTION: Sets a single blue pixel at (9, 9).
; PLAN: r0=9(x), r1=9(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 9
LDI r1, 9
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
