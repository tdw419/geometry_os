; DESCRIPTION: Places a black dot at position (414, 143).
; PLAN: r0=414(x), r1=143(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 414
LDI r1, 143
LDI r2, 0x000000
PSET r0, r1, r2
HALT
