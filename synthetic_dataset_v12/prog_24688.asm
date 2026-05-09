; DESCRIPTION: Sets a single blue pixel at (420, 115).
; PLAN: r0=420(x), r1=115(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 420
LDI r1, 115
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
