; DESCRIPTION: Places a black dot at position (475, 114).
; PLAN: r0=475(x), r1=114(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 475
LDI r1, 114
LDI r2, 0x000000
PSET r0, r1, r2
HALT
