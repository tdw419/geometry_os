; DESCRIPTION: Sets a single black pixel at (501, 0).
; PLAN: r0=501(x), r1=0(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 501
LDI r1, 0
LDI r2, 0x000000
PSET r0, r1, r2
HALT
