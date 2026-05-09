; DESCRIPTION: Places a black dot at position (1, 132).
; PLAN: r0=1(x), r1=132(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 1
LDI r1, 132
LDI r2, 0x000000
PSET r0, r1, r2
HALT
