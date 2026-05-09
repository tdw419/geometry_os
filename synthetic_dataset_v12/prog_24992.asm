; DESCRIPTION: Sets a single black pixel at (388, 226).
; PLAN: r0=388(x), r1=226(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 388
LDI r1, 226
LDI r2, 0x000000
PSET r0, r1, r2
HALT
