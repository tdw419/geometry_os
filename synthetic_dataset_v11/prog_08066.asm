; DESCRIPTION: Sets a single blue pixel at (151, 244).
; PLAN: r0=151(x), r1=244(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 151
LDI r1, 244
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
