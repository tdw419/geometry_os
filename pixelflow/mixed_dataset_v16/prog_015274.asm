; DESCRIPTION: Sets a single black pixel at (219, 87).
; PLAN: r0=219(x), r1=87(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 219
LDI r1, 87
LDI r2, 0x000000
PSET r0, r1, r2
HALT
