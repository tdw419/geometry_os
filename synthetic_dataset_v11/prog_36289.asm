; DESCRIPTION: Places a purple dot at position (100, 109).
; PLAN: r0=100(x), r1=109(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 100
LDI r1, 109
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
