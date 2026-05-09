; DESCRIPTION: Sets a single black pixel at (134, 88).
; PLAN: r0=134(x), r1=88(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 134
LDI r1, 88
LDI r2, 0x000000
PSET r0, r1, r2
HALT
