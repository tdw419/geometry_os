; DESCRIPTION: Places a purple dot at position (384, 118).
; PLAN: r0=384(x), r1=118(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 384
LDI r1, 118
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
