; DESCRIPTION: Sets a single blue pixel at (145, 166).
; PLAN: r0=145(x), r1=166(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 145
LDI r1, 166
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
