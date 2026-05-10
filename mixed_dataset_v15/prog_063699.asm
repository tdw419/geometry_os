; DESCRIPTION: Places a purple dot at position (321, 157).
; PLAN: r0=321(x), r1=157(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 321
LDI r1, 157
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
