; DESCRIPTION: Places a black dot at position (71, 92).
; PLAN: r0=71(x), r1=92(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 71
LDI r1, 92
LDI r2, 0x000000
PSET r0, r1, r2
HALT
