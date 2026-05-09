; DESCRIPTION: Sets a single yellow pixel at (491, 209).
; PLAN: r0=491(x), r1=209(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 491
LDI r1, 209
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
