; DESCRIPTION: Places a purple dot at position (89, 199).
; PLAN: r0=89(x), r1=199(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 89
LDI r1, 199
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
