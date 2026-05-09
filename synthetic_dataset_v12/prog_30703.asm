; DESCRIPTION: Sets a single black pixel at (475, 81).
; PLAN: r0=475(x), r1=81(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 475
LDI r1, 81
LDI r2, 0x000000
PSET r0, r1, r2
HALT
