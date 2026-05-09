; DESCRIPTION: Places a purple dot at position (24, 250).
; PLAN: r0=24(x), r1=250(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 24
LDI r1, 250
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
