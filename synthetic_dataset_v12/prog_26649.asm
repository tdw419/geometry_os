; DESCRIPTION: Places a black dot at position (227, 250).
; PLAN: r0=227(x), r1=250(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 227
LDI r1, 250
LDI r2, 0x000000
PSET r0, r1, r2
HALT
