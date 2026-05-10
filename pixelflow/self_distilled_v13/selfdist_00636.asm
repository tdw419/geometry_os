; DESCRIPTION: Places a purple dot at position (367, 26).
; PLAN: r0=367(x), r1=26(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 367
LDI r1, 26
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
