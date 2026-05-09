; DESCRIPTION: Places a purple dot at position (52, 155).
; PLAN: r0=52(x), r1=155(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 52
LDI r1, 155
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
