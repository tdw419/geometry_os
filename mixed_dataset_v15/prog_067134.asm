; DESCRIPTION: Sets a single blue pixel at (348, 204).
; PLAN: r0=348(x), r1=204(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 348
LDI r1, 204
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
