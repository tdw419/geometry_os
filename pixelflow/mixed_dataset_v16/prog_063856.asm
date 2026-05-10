; DESCRIPTION: Sets a single blue pixel at (164, 83).
; PLAN: r0=164(x), r1=83(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 164
LDI r1, 83
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
