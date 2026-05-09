; DESCRIPTION: Sets a single black pixel at (270, 6).
; PLAN: r0=270(x), r1=6(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 270
LDI r1, 6
LDI r2, 0x000000
PSET r0, r1, r2
HALT
