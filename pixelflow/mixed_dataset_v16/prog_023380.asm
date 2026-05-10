; DESCRIPTION: Sets a single black pixel at (427, 47).
; PLAN: r0=427(x), r1=47(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 427
LDI r1, 47
LDI r2, 0x000000
PSET r0, r1, r2
HALT
