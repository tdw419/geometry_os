; DESCRIPTION: Sets a single yellow pixel at (351, 236).
; PLAN: r0=351(x), r1=236(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 351
LDI r1, 236
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
