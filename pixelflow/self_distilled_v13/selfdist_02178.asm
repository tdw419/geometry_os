; DESCRIPTION: Sets a single blue pixel at (115, 70).
; PLAN: r0=115(x), r1=70(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 115
LDI r1, 70
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
