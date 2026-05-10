; DESCRIPTION: Sets a single blue pixel at (445, 58).
; PLAN: r0=445(x), r1=58(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 445
LDI r1, 58
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
