; DESCRIPTION: Sets a single yellow pixel at (308, 130).
; PLAN: r0=308(x), r1=130(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 308
LDI r1, 130
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
