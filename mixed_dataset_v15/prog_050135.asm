; DESCRIPTION: Places a purple dot at position (182, 136).
; PLAN: r0=182(x), r1=136(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 182
LDI r1, 136
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
