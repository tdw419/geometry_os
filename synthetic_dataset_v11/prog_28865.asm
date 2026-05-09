; DESCRIPTION: Places a black dot at position (102, 83).
; PLAN: r0=102(x), r1=83(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 102
LDI r1, 83
LDI r2, 0x000000
PSET r0, r1, r2
HALT
