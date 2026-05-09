; DESCRIPTION: Sets a single blue pixel at (26, 96).
; PLAN: r0=26(x), r1=96(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 26
LDI r1, 96
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
