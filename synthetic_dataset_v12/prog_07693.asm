; DESCRIPTION: Sets a single black pixel at (331, 178).
; PLAN: r0=331(x), r1=178(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 331
LDI r1, 178
LDI r2, 0x000000
PSET r0, r1, r2
HALT
