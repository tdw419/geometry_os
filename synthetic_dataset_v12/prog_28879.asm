; DESCRIPTION: Sets a single black pixel at (484, 176).
; PLAN: r0=484(x), r1=176(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 484
LDI r1, 176
LDI r2, 0x000000
PSET r0, r1, r2
HALT
