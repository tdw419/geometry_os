; DESCRIPTION: Places a black dot at position (399, 39).
; PLAN: r0=399(x), r1=39(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 399
LDI r1, 39
LDI r2, 0x000000
PSET r0, r1, r2
HALT
