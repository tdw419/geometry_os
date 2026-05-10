; DESCRIPTION: Places a purple dot at position (193, 48).
; PLAN: r0=193(x), r1=48(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 193
LDI r1, 48
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
