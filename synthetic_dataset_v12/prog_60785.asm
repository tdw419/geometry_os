; DESCRIPTION: Sets a single yellow pixel at (252, 234).
; PLAN: r0=252(x), r1=234(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 252
LDI r1, 234
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
