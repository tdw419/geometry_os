; DESCRIPTION: Sets a single blue pixel at (229, 181).
; PLAN: r0=229(x), r1=181(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 229
LDI r1, 181
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
