; DESCRIPTION: Sets a single black pixel at (87, 9).
; PLAN: r0=87(x), r1=9(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 87
LDI r1, 9
LDI r2, 0x000000
PSET r0, r1, r2
HALT
