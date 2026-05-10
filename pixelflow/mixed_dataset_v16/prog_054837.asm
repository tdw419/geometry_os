; DESCRIPTION: Places a purple dot at position (101, 6).
; PLAN: r0=101(x), r1=6(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 101
LDI r1, 6
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
