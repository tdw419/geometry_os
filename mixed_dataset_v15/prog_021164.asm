; DESCRIPTION: Sets a single black pixel at (298, 17).
; PLAN: r0=298(x), r1=17(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 298
LDI r1, 17
LDI r2, 0x000000
PSET r0, r1, r2
HALT
