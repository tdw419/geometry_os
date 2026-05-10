; DESCRIPTION: Places a purple dot at position (38, 98).
; PLAN: r0=38(x), r1=98(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 38
LDI r1, 98
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
