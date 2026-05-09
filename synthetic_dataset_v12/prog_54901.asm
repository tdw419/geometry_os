; DESCRIPTION: Places a black dot at position (22, 105).
; PLAN: r0=22(x), r1=105(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 22
LDI r1, 105
LDI r2, 0x000000
PSET r0, r1, r2
HALT
