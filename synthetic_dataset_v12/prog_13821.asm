; DESCRIPTION: Sets a single yellow pixel at (215, 245).
; PLAN: r0=215(x), r1=245(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 215
LDI r1, 245
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
