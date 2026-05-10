; DESCRIPTION: Sets a single blue pixel at (340, 63).
; PLAN: r0=340(x), r1=63(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 340
LDI r1, 63
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
