; DESCRIPTION: Places a purple dot at position (94, 40).
; PLAN: r0=94(x), r1=40(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 94
LDI r1, 40
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
