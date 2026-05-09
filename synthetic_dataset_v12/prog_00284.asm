; DESCRIPTION: Sets a single blue pixel at (458, 193).
; PLAN: r0=458(x), r1=193(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 458
LDI r1, 193
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
