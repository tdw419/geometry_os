; DESCRIPTION: Sets a single blue pixel at (100, 92).
; PLAN: r0=100(x), r1=92(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 100
LDI r1, 92
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
