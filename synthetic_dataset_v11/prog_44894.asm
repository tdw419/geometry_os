; DESCRIPTION: Places a black dot at position (226, 43).
; PLAN: r0=226(x), r1=43(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 226
LDI r1, 43
LDI r2, 0x000000
PSET r0, r1, r2
HALT
