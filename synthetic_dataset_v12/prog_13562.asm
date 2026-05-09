; DESCRIPTION: Sets a single yellow pixel at (438, 137).
; PLAN: r0=438(x), r1=137(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 438
LDI r1, 137
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
