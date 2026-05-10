; DESCRIPTION: Places a purple dot at position (234, 118).
; PLAN: r0=234(x), r1=118(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 234
LDI r1, 118
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
