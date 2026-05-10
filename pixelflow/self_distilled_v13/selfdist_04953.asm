; DESCRIPTION: Sets a single blue pixel at (99, 138).
; PLAN: r0=99(x), r1=138(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 99
LDI r1, 138
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
