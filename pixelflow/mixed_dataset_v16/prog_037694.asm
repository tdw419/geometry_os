; DESCRIPTION: Places a black dot at position (408, 241).
; PLAN: r0=408(x), r1=241(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 408
LDI r1, 241
LDI r2, 0x000000
PSET r0, r1, r2
HALT
