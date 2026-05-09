; DESCRIPTION: Sets a single purple pixel at (163, 181).
; PLAN: r0=163(x), r1=181(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 163
LDI r1, 181
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
