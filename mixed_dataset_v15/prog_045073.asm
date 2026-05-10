; DESCRIPTION: Places a black dot at position (65, 72).
; PLAN: r0=65(x), r1=72(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 65
LDI r1, 72
LDI r2, 0x000000
PSET r0, r1, r2
HALT
