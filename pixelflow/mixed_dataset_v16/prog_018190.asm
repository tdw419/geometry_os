; DESCRIPTION: Sets a single yellow pixel at (218, 122).
; PLAN: r0=218(x), r1=122(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 218
LDI r1, 122
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
