; DESCRIPTION: Sets a single yellow pixel at (91, 176).
; PLAN: r0=91(x), r1=176(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 91
LDI r1, 176
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
