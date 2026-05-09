; DESCRIPTION: Places a black dot at position (134, 97).
; PLAN: r0=134(x), r1=97(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 134
LDI r1, 97
LDI r2, 0x000000
PSET r0, r1, r2
HALT
