; DESCRIPTION: Sets a single black pixel at (204, 200).
; PLAN: r0=204(x), r1=200(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 204
LDI r1, 200
LDI r2, 0x000000
PSET r0, r1, r2
HALT
