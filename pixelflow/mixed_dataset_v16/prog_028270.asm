; DESCRIPTION: Sets a single blue pixel at (22, 218).
; PLAN: r0=22(x), r1=218(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 22
LDI r1, 218
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
