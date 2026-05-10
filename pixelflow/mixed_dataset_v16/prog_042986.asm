; DESCRIPTION: Sets a single blue pixel at (24, 224).
; PLAN: r0=24(x), r1=224(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 24
LDI r1, 224
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
