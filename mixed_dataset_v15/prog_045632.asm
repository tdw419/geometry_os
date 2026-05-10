; DESCRIPTION: Places a purple dot at position (100, 237).
; PLAN: r0=100(x), r1=237(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 100
LDI r1, 237
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
