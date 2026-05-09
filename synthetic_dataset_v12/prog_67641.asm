; DESCRIPTION: Sets a single blue pixel at (468, 4).
; PLAN: r0=468(x), r1=4(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 468
LDI r1, 4
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
