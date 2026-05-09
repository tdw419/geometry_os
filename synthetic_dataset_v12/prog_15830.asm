; DESCRIPTION: Sets a single blue pixel at (160, 114).
; PLAN: r0=160(x), r1=114(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 160
LDI r1, 114
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
