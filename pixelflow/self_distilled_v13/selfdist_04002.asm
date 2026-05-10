; DESCRIPTION: Sets a single yellow pixel at (37, 195).
; PLAN: r0=37(x), r1=195(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 37
LDI r1, 195
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
