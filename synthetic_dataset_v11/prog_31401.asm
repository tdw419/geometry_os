; DESCRIPTION: Sets a single black pixel at (115, 78).
; PLAN: r0=115(x), r1=78(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 115
LDI r1, 78
LDI r2, 0x000000
PSET r0, r1, r2
HALT
