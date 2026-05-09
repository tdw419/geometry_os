; DESCRIPTION: Sets a single blue pixel at (55, 247).
; PLAN: r0=55(x), r1=247(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 55
LDI r1, 247
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
