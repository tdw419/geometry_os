; DESCRIPTION: Places a black dot at position (58, 58).
; PLAN: r0=58(x), r1=58(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 58
LDI r1, 58
LDI r2, 0x000000
PSET r0, r1, r2
HALT
