; DESCRIPTION: Places a purple dot at position (268, 84).
; PLAN: r0=268(x), r1=84(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 268
LDI r1, 84
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
