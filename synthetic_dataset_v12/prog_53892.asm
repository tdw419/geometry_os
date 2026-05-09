; DESCRIPTION: Places a purple dot at position (21, 100).
; PLAN: r0=21(x), r1=100(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 21
LDI r1, 100
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
