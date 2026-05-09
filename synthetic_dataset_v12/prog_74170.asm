; DESCRIPTION: Sets a single black pixel at (338, 110).
; PLAN: r0=338(x), r1=110(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 338
LDI r1, 110
LDI r2, 0x000000
PSET r0, r1, r2
HALT
