; DESCRIPTION: Places a black dot at position (457, 45).
; PLAN: r0=457(x), r1=45(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 457
LDI r1, 45
LDI r2, 0x000000
PSET r0, r1, r2
HALT
