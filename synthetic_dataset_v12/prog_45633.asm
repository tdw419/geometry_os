; DESCRIPTION: Sets a single black pixel at (19, 100).
; PLAN: r0=19(x), r1=100(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 19
LDI r1, 100
LDI r2, 0x000000
PSET r0, r1, r2
HALT
