; DESCRIPTION: Places a purple dot at position (82, 142).
; PLAN: r0=82(x), r1=142(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 82
LDI r1, 142
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
