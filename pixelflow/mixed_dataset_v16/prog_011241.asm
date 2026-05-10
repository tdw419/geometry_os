; DESCRIPTION: Places a black dot at position (140, 178).
; PLAN: r0=140(x), r1=178(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 140
LDI r1, 178
LDI r2, 0x000000
PSET r0, r1, r2
HALT
