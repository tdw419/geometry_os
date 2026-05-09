; DESCRIPTION: Places a purple dot at position (262, 110).
; PLAN: r0=262(x), r1=110(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 262
LDI r1, 110
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
