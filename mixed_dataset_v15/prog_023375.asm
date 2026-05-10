; DESCRIPTION: Places a purple dot at position (355, 76).
; PLAN: r0=355(x), r1=76(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 355
LDI r1, 76
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
