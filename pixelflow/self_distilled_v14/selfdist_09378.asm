; DESCRIPTION: Places a purple dot at position (282, 93).
; PLAN: r0=282(x), r1=93(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 282
LDI r1, 93
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
