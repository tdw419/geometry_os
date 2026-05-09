; DESCRIPTION: Sets a single blue pixel at (498, 82).
; PLAN: r0=498(x), r1=82(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 498
LDI r1, 82
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
