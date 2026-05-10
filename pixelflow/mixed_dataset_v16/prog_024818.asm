; DESCRIPTION: Sets a single black pixel at (430, 3).
; PLAN: r0=430(x), r1=3(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 430
LDI r1, 3
LDI r2, 0x000000
PSET r0, r1, r2
HALT
