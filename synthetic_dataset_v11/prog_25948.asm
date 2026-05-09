; DESCRIPTION: Sets a single black pixel at (252, 53).
; PLAN: r0=252(x), r1=53(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 252
LDI r1, 53
LDI r2, 0x000000
PSET r0, r1, r2
HALT
