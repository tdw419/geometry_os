; DESCRIPTION: Sets a single yellow pixel at (359, 31).
; PLAN: r0=359(x), r1=31(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 359
LDI r1, 31
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
