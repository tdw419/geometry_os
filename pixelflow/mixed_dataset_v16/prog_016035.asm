; DESCRIPTION: Sets a single yellow pixel at (189, 183).
; PLAN: r0=189(x), r1=183(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 189
LDI r1, 183
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
