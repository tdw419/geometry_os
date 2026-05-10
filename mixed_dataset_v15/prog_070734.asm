; DESCRIPTION: Sets a single blue pixel at (210, 110).
; PLAN: r0=210(x), r1=110(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 210
LDI r1, 110
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
