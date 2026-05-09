; DESCRIPTION: Sets a single blue pixel at (218, 230).
; PLAN: r0=218(x), r1=230(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 218
LDI r1, 230
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
