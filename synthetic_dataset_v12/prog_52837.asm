; DESCRIPTION: Places a black dot at position (396, 61).
; PLAN: r0=396(x), r1=61(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 396
LDI r1, 61
LDI r2, 0x000000
PSET r0, r1, r2
HALT
