; DESCRIPTION: Places a black dot at position (88, 163).
; PLAN: r0=88(x), r1=163(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 88
LDI r1, 163
LDI r2, 0x000000
PSET r0, r1, r2
HALT
