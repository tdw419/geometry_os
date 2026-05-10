; DESCRIPTION: Sets a single black pixel at (285, 155).
; PLAN: r0=285(x), r1=155(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 285
LDI r1, 155
LDI r2, 0x000000
PSET r0, r1, r2
HALT
