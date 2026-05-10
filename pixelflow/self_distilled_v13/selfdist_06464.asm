; DESCRIPTION: Sets a single yellow pixel at (7, 133).
; PLAN: r0=7(x), r1=133(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 7
LDI r1, 133
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
