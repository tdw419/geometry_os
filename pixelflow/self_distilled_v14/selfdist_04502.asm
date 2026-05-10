; DESCRIPTION: Places a purple dot at position (382, 53).
; PLAN: r0=382(x), r1=53(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 382
LDI r1, 53
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
