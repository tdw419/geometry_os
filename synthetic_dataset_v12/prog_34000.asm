; DESCRIPTION: Sets a single yellow pixel at (400, 43).
; PLAN: r0=400(x), r1=43(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 400
LDI r1, 43
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
