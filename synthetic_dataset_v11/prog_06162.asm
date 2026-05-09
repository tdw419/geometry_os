; DESCRIPTION: Sets a single black pixel at (11, 212).
; PLAN: r0=11(x), r1=212(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 11
LDI r1, 212
LDI r2, 0x000000
PSET r0, r1, r2
HALT
