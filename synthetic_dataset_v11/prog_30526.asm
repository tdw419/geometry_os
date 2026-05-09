; DESCRIPTION: Sets a single blue pixel at (18, 40).
; PLAN: r0=18(x), r1=40(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 18
LDI r1, 40
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
