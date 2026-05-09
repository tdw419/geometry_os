; DESCRIPTION: Sets a single blue pixel at (183, 39).
; PLAN: r0=183(x), r1=39(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 183
LDI r1, 39
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
