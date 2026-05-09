; DESCRIPTION: Sets a single black pixel at (172, 232).
; PLAN: r0=172(x), r1=232(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 172
LDI r1, 232
LDI r2, 0x000000
PSET r0, r1, r2
HALT
