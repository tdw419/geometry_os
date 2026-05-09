; DESCRIPTION: Places a purple dot at position (124, 196).
; PLAN: r0=124(x), r1=196(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 124
LDI r1, 196
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
