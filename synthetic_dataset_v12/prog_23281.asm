; DESCRIPTION: Places a purple dot at position (422, 49).
; PLAN: r0=422(x), r1=49(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 422
LDI r1, 49
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
