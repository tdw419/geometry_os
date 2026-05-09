; DESCRIPTION: Places a black dot at position (323, 227).
; PLAN: r0=323(x), r1=227(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 323
LDI r1, 227
LDI r2, 0x000000
PSET r0, r1, r2
HALT
