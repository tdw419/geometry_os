; DESCRIPTION: Sets a single black pixel at (129, 142).
; PLAN: r0=129(x), r1=142(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 129
LDI r1, 142
LDI r2, 0x000000
PSET r0, r1, r2
HALT
