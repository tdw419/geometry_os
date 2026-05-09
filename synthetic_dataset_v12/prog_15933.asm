; DESCRIPTION: Sets a single yellow pixel at (89, 128).
; PLAN: r0=89(x), r1=128(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 89
LDI r1, 128
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
