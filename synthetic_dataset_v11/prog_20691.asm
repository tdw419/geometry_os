; DESCRIPTION: Sets a single yellow pixel at (84, 84).
; PLAN: r0=84(x), r1=84(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 84
LDI r1, 84
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
