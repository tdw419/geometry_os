; DESCRIPTION: Places a black dot at position (167, 149).
; PLAN: r0=167(x), r1=149(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 167
LDI r1, 149
LDI r2, 0x000000
PSET r0, r1, r2
HALT
