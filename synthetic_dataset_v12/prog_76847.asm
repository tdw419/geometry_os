; DESCRIPTION: Sets a single black pixel at (301, 13).
; PLAN: r0=301(x), r1=13(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 301
LDI r1, 13
LDI r2, 0x000000
PSET r0, r1, r2
HALT
