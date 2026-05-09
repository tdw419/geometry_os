; DESCRIPTION: Places a purple dot at position (163, 123).
; PLAN: r0=163(x), r1=123(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 163
LDI r1, 123
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
