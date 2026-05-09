; DESCRIPTION: Sets a single yellow pixel at (261, 220).
; PLAN: r0=261(x), r1=220(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 261
LDI r1, 220
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
