; DESCRIPTION: Sets a single blue pixel at (178, 35).
; PLAN: r0=178(x), r1=35(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 178
LDI r1, 35
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
