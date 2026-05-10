; DESCRIPTION: Sets a single yellow pixel at (132, 74).
; PLAN: r0=132(x), r1=74(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 132
LDI r1, 74
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
