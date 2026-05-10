; DESCRIPTION: Places a black dot at position (99, 44).
; PLAN: r0=99(x), r1=44(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 99
LDI r1, 44
LDI r2, 0x000000
PSET r0, r1, r2
HALT
