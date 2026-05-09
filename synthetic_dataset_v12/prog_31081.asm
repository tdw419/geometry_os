; DESCRIPTION: Places a purple dot at position (238, 109).
; PLAN: r0=238(x), r1=109(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 238
LDI r1, 109
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
