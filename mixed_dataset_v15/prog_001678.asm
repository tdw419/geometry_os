; DESCRIPTION: Sets a single yellow pixel at (114, 126).
; PLAN: r0=114(x), r1=126(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 114
LDI r1, 126
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
