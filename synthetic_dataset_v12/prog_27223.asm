; DESCRIPTION: Places a purple dot at position (10, 85).
; PLAN: r0=10(x), r1=85(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 10
LDI r1, 85
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
