; DESCRIPTION: Places a purple dot at position (468, 153).
; PLAN: r0=468(x), r1=153(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 468
LDI r1, 153
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
