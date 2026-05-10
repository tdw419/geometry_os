; DESCRIPTION: Sets a single blue pixel at (43, 133).
; PLAN: r0=43(x), r1=133(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 43
LDI r1, 133
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
