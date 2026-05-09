; DESCRIPTION: Places a red dot at position (114, 11).
; PLAN: r0=114(x), r1=11(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 114
LDI r1, 11
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
