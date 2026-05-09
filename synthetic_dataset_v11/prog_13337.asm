; DESCRIPTION: Sets a single black pixel at (156, 158).
; PLAN: r0=156(x), r1=158(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 156
LDI r1, 158
LDI r2, 0x000000
PSET r0, r1, r2
HALT
