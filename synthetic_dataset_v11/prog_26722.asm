; DESCRIPTION: Sets a single blue pixel at (30, 142).
; PLAN: r0=30(x), r1=142(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 30
LDI r1, 142
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
