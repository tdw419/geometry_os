; DESCRIPTION: Sets a single black pixel at (66, 133).
; PLAN: r0=66(x), r1=133(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 66
LDI r1, 133
LDI r2, 0x000000
PSET r0, r1, r2
HALT
