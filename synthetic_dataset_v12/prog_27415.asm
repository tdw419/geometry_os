; DESCRIPTION: Sets a single yellow pixel at (424, 33).
; PLAN: r0=424(x), r1=33(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 424
LDI r1, 33
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
