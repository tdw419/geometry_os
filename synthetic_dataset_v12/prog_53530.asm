; DESCRIPTION: Sets a single yellow pixel at (496, 84).
; PLAN: r0=496(x), r1=84(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 496
LDI r1, 84
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
