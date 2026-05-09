; DESCRIPTION: Sets a single black pixel at (308, 195).
; PLAN: r0=308(x), r1=195(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 308
LDI r1, 195
LDI r2, 0x000000
PSET r0, r1, r2
HALT
