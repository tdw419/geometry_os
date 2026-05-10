; DESCRIPTION: Sets a single blue pixel at (254, 190).
; PLAN: r0=254(x), r1=190(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 254
LDI r1, 190
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
