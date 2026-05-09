; DESCRIPTION: Sets a single blue pixel at (411, 163).
; PLAN: r0=411(x), r1=163(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 411
LDI r1, 163
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
