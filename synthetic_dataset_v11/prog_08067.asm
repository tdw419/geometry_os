; DESCRIPTION: Sets a single black pixel at (54, 25).
; PLAN: r0=54(x), r1=25(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 54
LDI r1, 25
LDI r2, 0x000000
PSET r0, r1, r2
HALT
