; DESCRIPTION: Sets a single blue pixel at (181, 73).
; PLAN: r0=181(x), r1=73(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 181
LDI r1, 73
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
