; DESCRIPTION: Sets a single black pixel at (195, 7).
; PLAN: r0=195(x), r1=7(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 195
LDI r1, 7
LDI r2, 0x000000
PSET r0, r1, r2
HALT
