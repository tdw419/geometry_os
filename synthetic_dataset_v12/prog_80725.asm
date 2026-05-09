; DESCRIPTION: Sets a single blue pixel at (393, 239).
; PLAN: r0=393(x), r1=239(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 393
LDI r1, 239
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
