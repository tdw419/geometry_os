; DESCRIPTION: Places a black dot at position (148, 62).
; PLAN: r0=148(x), r1=62(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 148
LDI r1, 62
LDI r2, 0x000000
PSET r0, r1, r2
HALT
