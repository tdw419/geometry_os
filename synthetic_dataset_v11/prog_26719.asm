; DESCRIPTION: Places a purple dot at position (106, 140).
; PLAN: r0=106(x), r1=140(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 106
LDI r1, 140
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
