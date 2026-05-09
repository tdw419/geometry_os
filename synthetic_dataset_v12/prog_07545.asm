; DESCRIPTION: Sets a single blue pixel at (503, 43).
; PLAN: r0=503(x), r1=43(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 503
LDI r1, 43
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
