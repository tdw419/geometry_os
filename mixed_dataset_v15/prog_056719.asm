; DESCRIPTION: Sets a single blue pixel at (354, 7).
; PLAN: r0=354(x), r1=7(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 354
LDI r1, 7
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
