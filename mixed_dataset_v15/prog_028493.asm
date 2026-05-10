; DESCRIPTION: Sets a single yellow pixel at (349, 51).
; PLAN: r0=349(x), r1=51(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 349
LDI r1, 51
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
