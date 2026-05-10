; DESCRIPTION: Places a black dot at position (316, 242).
; PLAN: r0=316(x), r1=242(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 316
LDI r1, 242
LDI r2, 0x000000
PSET r0, r1, r2
HALT
