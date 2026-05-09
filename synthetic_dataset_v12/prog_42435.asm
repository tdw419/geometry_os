; DESCRIPTION: Places a purple dot at position (221, 184).
; PLAN: r0=221(x), r1=184(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 221
LDI r1, 184
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
