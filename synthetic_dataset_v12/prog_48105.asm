; DESCRIPTION: Sets a single yellow pixel at (505, 157).
; PLAN: r0=505(x), r1=157(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 505
LDI r1, 157
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
