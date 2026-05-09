; DESCRIPTION: Places a black dot at position (170, 175).
; PLAN: r0=170(x), r1=175(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 170
LDI r1, 175
LDI r2, 0x000000
PSET r0, r1, r2
HALT
