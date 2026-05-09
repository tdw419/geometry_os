; DESCRIPTION: Sets a single black pixel at (79, 21).
; PLAN: r0=79(x), r1=21(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 79
LDI r1, 21
LDI r2, 0x000000
PSET r0, r1, r2
HALT
