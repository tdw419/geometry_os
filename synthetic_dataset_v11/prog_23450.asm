; DESCRIPTION: Sets a single blue pixel at (19, 137).
; PLAN: r0=19(x), r1=137(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 19
LDI r1, 137
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
