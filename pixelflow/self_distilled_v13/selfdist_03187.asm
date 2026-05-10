; DESCRIPTION: Places a red dot at position (134, 58).
; PLAN: r0=134(x), r1=58(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 134
LDI r1, 58
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
