; DESCRIPTION: Places a purple dot at position (68, 96).
; PLAN: r0=68(x), r1=96(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 68
LDI r1, 96
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
