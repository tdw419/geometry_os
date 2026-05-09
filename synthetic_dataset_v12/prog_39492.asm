; DESCRIPTION: Places a purple dot at position (473, 148).
; PLAN: r0=473(x), r1=148(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 473
LDI r1, 148
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
