; DESCRIPTION: Sets a single black pixel at (78, 79).
; PLAN: r0=78(x), r1=79(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 78
LDI r1, 79
LDI r2, 0x000000
PSET r0, r1, r2
HALT
