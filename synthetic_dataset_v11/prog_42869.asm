; DESCRIPTION: Places a black dot at position (194, 82).
; PLAN: r0=194(x), r1=82(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 194
LDI r1, 82
LDI r2, 0x000000
PSET r0, r1, r2
HALT
