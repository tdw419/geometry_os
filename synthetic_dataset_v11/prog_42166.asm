; DESCRIPTION: Sets a single black pixel at (219, 25).
; PLAN: r0=219(x), r1=25(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 219
LDI r1, 25
LDI r2, 0x000000
PSET r0, r1, r2
HALT
