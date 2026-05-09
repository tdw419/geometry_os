; DESCRIPTION: Places a purple dot at position (493, 84).
; PLAN: r0=493(x), r1=84(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 493
LDI r1, 84
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
