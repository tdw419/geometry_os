; DESCRIPTION: Places a purple dot at position (240, 119).
; PLAN: r0=240(x), r1=119(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 240
LDI r1, 119
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
