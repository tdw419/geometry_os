; DESCRIPTION: Sets a single blue pixel at (414, 2).
; PLAN: r0=414(x), r1=2(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 414
LDI r1, 2
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
