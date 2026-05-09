; DESCRIPTION: Sets a single blue pixel at (470, 241).
; PLAN: r0=470(x), r1=241(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 470
LDI r1, 241
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
