; DESCRIPTION: Sets a single blue pixel at (485, 189).
; PLAN: r0=485(x), r1=189(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 485
LDI r1, 189
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
