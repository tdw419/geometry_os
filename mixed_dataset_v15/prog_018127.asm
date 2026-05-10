; DESCRIPTION: Sets a single black pixel at (17, 124).
; PLAN: r0=17(x), r1=124(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 17
LDI r1, 124
LDI r2, 0x000000
PSET r0, r1, r2
HALT
