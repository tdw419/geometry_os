; DESCRIPTION: Sets a single black pixel at (44, 32).
; PLAN: r0=44(x), r1=32(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 44
LDI r1, 32
LDI r2, 0x000000
PSET r0, r1, r2
HALT
