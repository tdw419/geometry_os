; DESCRIPTION: Sets a single black pixel at (167, 137).
; PLAN: r0=167(x), r1=137(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 167
LDI r1, 137
LDI r2, 0x000000
PSET r0, r1, r2
HALT
