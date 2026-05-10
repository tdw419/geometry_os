; DESCRIPTION: Sets a single blue pixel at (37, 136).
; PLAN: r0=37(x), r1=136(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 37
LDI r1, 136
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
