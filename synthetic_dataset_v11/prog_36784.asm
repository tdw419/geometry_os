; DESCRIPTION: Places a purple dot at position (204, 67).
; PLAN: r0=204(x), r1=67(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 204
LDI r1, 67
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
