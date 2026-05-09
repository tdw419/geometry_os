; DESCRIPTION: Sets a single blue pixel at (259, 155).
; PLAN: r0=259(x), r1=155(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 259
LDI r1, 155
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
