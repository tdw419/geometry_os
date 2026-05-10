; DESCRIPTION: Sets a single yellow pixel at (84, 202).
; PLAN: r0=84(x), r1=202(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 84
LDI r1, 202
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
