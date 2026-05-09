; DESCRIPTION: Places a black dot at position (118, 23).
; PLAN: r0=118(x), r1=23(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 118
LDI r1, 23
LDI r2, 0x000000
PSET r0, r1, r2
HALT
