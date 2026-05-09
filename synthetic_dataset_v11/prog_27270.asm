; DESCRIPTION: Places a black dot at position (106, 8).
; PLAN: r0=106(x), r1=8(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 106
LDI r1, 8
LDI r2, 0x000000
PSET r0, r1, r2
HALT
