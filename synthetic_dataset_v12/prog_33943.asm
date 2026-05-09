; DESCRIPTION: Sets a single black pixel at (505, 156).
; PLAN: r0=505(x), r1=156(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 505
LDI r1, 156
LDI r2, 0x000000
PSET r0, r1, r2
HALT
