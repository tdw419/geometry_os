; DESCRIPTION: Places a purple dot at position (90, 38).
; PLAN: r0=90(x), r1=38(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 90
LDI r1, 38
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
