; DESCRIPTION: Sets a single black pixel at (248, 206).
; PLAN: r0=248(x), r1=206(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 248
LDI r1, 206
LDI r2, 0x000000
PSET r0, r1, r2
HALT
