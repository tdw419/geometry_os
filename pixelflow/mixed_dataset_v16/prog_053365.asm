; DESCRIPTION: Sets a single black pixel at (166, 12).
; PLAN: r0=166(x), r1=12(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 166
LDI r1, 12
LDI r2, 0x000000
PSET r0, r1, r2
HALT
