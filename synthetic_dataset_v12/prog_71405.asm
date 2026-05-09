; DESCRIPTION: Sets a single blue pixel at (318, 139).
; PLAN: r0=318(x), r1=139(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 318
LDI r1, 139
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
