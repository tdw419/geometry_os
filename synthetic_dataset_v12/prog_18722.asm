; DESCRIPTION: Sets a single blue pixel at (422, 135).
; PLAN: r0=422(x), r1=135(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 422
LDI r1, 135
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
