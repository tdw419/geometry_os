; DESCRIPTION: Sets a single black pixel at (185, 11).
; PLAN: r0=185(x), r1=11(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 185
LDI r1, 11
LDI r2, 0x000000
PSET r0, r1, r2
HALT
