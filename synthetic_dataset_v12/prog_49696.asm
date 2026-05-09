; DESCRIPTION: Sets a single blue pixel at (56, 173).
; PLAN: r0=56(x), r1=173(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 56
LDI r1, 173
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
