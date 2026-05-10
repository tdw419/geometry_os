; DESCRIPTION: Sets a single blue pixel at (343, 196).
; PLAN: r0=343(x), r1=196(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 343
LDI r1, 196
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
