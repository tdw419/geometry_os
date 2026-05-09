; DESCRIPTION: Places a purple dot at position (349, 13).
; PLAN: r0=349(x), r1=13(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 349
LDI r1, 13
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
