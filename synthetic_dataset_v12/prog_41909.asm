; DESCRIPTION: Places a purple dot at position (316, 36).
; PLAN: r0=316(x), r1=36(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 316
LDI r1, 36
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
