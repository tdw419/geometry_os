; DESCRIPTION: Sets a single blue pixel at (385, 129).
; PLAN: r0=385(x), r1=129(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 385
LDI r1, 129
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
