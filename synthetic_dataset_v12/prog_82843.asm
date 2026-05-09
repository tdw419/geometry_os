; DESCRIPTION: Places a purple dot at position (111, 191).
; PLAN: r0=111(x), r1=191(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 111
LDI r1, 191
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
