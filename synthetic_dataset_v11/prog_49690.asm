; DESCRIPTION: Places a purple dot at position (2, 114).
; PLAN: r0=2(x), r1=114(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 2
LDI r1, 114
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
