; DESCRIPTION: Sets a single blue pixel at (112, 238).
; PLAN: r0=112(x), r1=238(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 112
LDI r1, 238
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
