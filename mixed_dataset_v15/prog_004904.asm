; DESCRIPTION: Sets a single blue pixel at (252, 47).
; PLAN: r0=252(x), r1=47(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 252
LDI r1, 47
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
