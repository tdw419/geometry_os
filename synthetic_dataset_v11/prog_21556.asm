; DESCRIPTION: Places a purple dot at position (113, 112).
; PLAN: r0=113(x), r1=112(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 113
LDI r1, 112
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
