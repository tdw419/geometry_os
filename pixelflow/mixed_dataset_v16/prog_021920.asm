; DESCRIPTION: Sets a single black pixel at (200, 17).
; PLAN: r0=200(x), r1=17(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 200
LDI r1, 17
LDI r2, 0x000000
PSET r0, r1, r2
HALT
