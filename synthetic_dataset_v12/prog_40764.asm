; DESCRIPTION: Places a black dot at position (207, 194).
; PLAN: r0=207(x), r1=194(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 207
LDI r1, 194
LDI r2, 0x000000
PSET r0, r1, r2
HALT
