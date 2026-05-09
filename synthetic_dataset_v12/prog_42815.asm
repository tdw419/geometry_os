; DESCRIPTION: Sets a single blue pixel at (12, 203).
; PLAN: r0=12(x), r1=203(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 12
LDI r1, 203
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
