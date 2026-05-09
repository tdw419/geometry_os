; DESCRIPTION: Sets a single blue pixel at (237, 192).
; PLAN: r0=237(x), r1=192(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 237
LDI r1, 192
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
