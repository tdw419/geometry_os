; DESCRIPTION: Sets a single blue pixel at (61, 131).
; PLAN: r0=61(x), r1=131(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 61
LDI r1, 131
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
