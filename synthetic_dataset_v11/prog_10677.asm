; DESCRIPTION: Places a purple dot at position (135, 83).
; PLAN: r0=135(x), r1=83(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 135
LDI r1, 83
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
