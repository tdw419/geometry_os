; DESCRIPTION: Sets a single black pixel at (114, 30).
; PLAN: r0=114(x), r1=30(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 114
LDI r1, 30
LDI r2, 0x000000
PSET r0, r1, r2
HALT
