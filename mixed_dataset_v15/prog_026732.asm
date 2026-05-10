; DESCRIPTION: Sets a single black pixel at (137, 245).
; PLAN: r0=137(x), r1=245(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 137
LDI r1, 245
LDI r2, 0x000000
PSET r0, r1, r2
HALT
