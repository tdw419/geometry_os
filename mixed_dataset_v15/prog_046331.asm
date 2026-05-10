; DESCRIPTION: Places a purple dot at position (72, 193).
; PLAN: r0=72(x), r1=193(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 72
LDI r1, 193
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
