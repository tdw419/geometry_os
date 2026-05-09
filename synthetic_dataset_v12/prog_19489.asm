; DESCRIPTION: Places a black dot at position (286, 25).
; PLAN: r0=286(x), r1=25(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 286
LDI r1, 25
LDI r2, 0x000000
PSET r0, r1, r2
HALT
