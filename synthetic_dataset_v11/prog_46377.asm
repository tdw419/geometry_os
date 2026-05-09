; DESCRIPTION: Sets a single blue pixel at (50, 37).
; PLAN: r0=50(x), r1=37(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 50
LDI r1, 37
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
