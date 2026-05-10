; DESCRIPTION: Sets a single yellow pixel at (77, 127).
; PLAN: r0=77(x), r1=127(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 77
LDI r1, 127
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
