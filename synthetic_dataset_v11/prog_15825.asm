; DESCRIPTION: Sets a single yellow pixel at (76, 250).
; PLAN: r0=76(x), r1=250(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 76
LDI r1, 250
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
