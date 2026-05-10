; DESCRIPTION: Sets a single blue pixel at (387, 189).
; PLAN: r0=387(x), r1=189(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 387
LDI r1, 189
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
