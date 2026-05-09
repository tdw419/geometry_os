; DESCRIPTION: Sets a single blue pixel at (424, 144).
; PLAN: r0=424(x), r1=144(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 424
LDI r1, 144
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
