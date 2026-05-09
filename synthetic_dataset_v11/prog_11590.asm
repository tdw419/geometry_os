; DESCRIPTION: Places a black dot at position (162, 105).
; PLAN: r0=162(x), r1=105(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 162
LDI r1, 105
LDI r2, 0x000000
PSET r0, r1, r2
HALT
