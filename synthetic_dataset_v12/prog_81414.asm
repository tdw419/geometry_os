; DESCRIPTION: Places a purple dot at position (86, 1).
; PLAN: r0=86(x), r1=1(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 86
LDI r1, 1
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
