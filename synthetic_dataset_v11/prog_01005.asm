; DESCRIPTION: Places a purple dot at position (233, 201).
; PLAN: r0=233(x), r1=201(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 233
LDI r1, 201
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
