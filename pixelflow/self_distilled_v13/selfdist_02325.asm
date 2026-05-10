; DESCRIPTION: Sets a single blue pixel at (253, 99).
; PLAN: r0=253(x), r1=99(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 253
LDI r1, 99
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
