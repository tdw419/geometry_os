; DESCRIPTION: Places a black dot at position (122, 140).
; PLAN: r0=122(x), r1=140(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 122
LDI r1, 140
LDI r2, 0x000000
PSET r0, r1, r2
HALT
