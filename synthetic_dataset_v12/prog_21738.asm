; DESCRIPTION: Sets a single blue pixel at (508, 91).
; PLAN: r0=508(x), r1=91(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 508
LDI r1, 91
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
