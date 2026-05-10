; DESCRIPTION: Places a purple dot at position (135, 162).
; PLAN: r0=135(x), r1=162(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 135
LDI r1, 162
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
