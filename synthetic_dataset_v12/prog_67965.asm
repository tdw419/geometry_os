; DESCRIPTION: Places a red dot at position (71, 114).
; PLAN: r0=71(x), r1=114(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 71
LDI r1, 114
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
