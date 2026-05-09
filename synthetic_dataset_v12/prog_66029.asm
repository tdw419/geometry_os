; DESCRIPTION: Places a black dot at position (276, 122).
; PLAN: r0=276(x), r1=122(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 276
LDI r1, 122
LDI r2, 0x000000
PSET r0, r1, r2
HALT
