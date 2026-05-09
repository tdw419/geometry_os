; DESCRIPTION: Sets a single black pixel at (276, 7).
; PLAN: r0=276(x), r1=7(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 276
LDI r1, 7
LDI r2, 0x000000
PSET r0, r1, r2
HALT
