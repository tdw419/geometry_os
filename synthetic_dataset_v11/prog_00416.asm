; DESCRIPTION: Places a purple dot at position (11, 97).
; PLAN: r0=11(x), r1=97(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 11
LDI r1, 97
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
