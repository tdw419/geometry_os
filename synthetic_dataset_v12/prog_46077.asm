; DESCRIPTION: Sets a single blue pixel at (414, 223).
; PLAN: r0=414(x), r1=223(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 414
LDI r1, 223
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
