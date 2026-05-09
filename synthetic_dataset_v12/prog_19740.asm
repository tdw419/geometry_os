; DESCRIPTION: Sets a single blue pixel at (223, 82).
; PLAN: r0=223(x), r1=82(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 223
LDI r1, 82
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
