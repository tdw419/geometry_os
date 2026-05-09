; DESCRIPTION: Places a black dot at position (39, 147).
; PLAN: r0=39(x), r1=147(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 39
LDI r1, 147
LDI r2, 0x000000
PSET r0, r1, r2
HALT
