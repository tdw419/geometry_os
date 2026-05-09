; DESCRIPTION: Sets a single blue pixel at (450, 248).
; PLAN: r0=450(x), r1=248(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 450
LDI r1, 248
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
