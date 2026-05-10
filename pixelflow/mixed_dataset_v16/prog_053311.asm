; DESCRIPTION: Sets a single blue pixel at (143, 6).
; PLAN: r0=143(x), r1=6(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 143
LDI r1, 6
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
