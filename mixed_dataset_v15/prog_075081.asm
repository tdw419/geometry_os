; DESCRIPTION: Sets a single yellow pixel at (232, 249).
; PLAN: r0=232(x), r1=249(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 232
LDI r1, 249
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
