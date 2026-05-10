; DESCRIPTION: Sets a single black pixel at (76, 163).
; PLAN: r0=76(x), r1=163(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 76
LDI r1, 163
LDI r2, 0x000000
PSET r0, r1, r2
HALT
