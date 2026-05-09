; DESCRIPTION: Sets a single yellow pixel at (172, 248).
; PLAN: r0=172(x), r1=248(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 172
LDI r1, 248
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
