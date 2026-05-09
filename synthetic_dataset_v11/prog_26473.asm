; DESCRIPTION: Places a black dot at position (6, 81).
; PLAN: r0=6(x), r1=81(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 6
LDI r1, 81
LDI r2, 0x000000
PSET r0, r1, r2
HALT
