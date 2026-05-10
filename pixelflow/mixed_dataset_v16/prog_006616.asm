; DESCRIPTION: Places a purple dot at position (315, 130).
; PLAN: r0=315(x), r1=130(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 315
LDI r1, 130
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
