; DESCRIPTION: Sets a single black pixel at (26, 52).
; PLAN: r0=26(x), r1=52(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 26
LDI r1, 52
LDI r2, 0x000000
PSET r0, r1, r2
HALT
