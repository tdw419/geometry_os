; DESCRIPTION: Sets a single blue pixel at (72, 167).
; PLAN: r0=72(x), r1=167(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 72
LDI r1, 167
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
