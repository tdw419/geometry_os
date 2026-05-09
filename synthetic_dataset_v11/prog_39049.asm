; DESCRIPTION: Sets a single blue pixel at (90, 55).
; PLAN: r0=90(x), r1=55(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 90
LDI r1, 55
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
