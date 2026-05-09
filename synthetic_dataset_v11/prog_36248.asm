; DESCRIPTION: Sets a single blue pixel at (184, 237).
; PLAN: r0=184(x), r1=237(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 184
LDI r1, 237
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
