; DESCRIPTION: Places a purple dot at position (161, 137).
; PLAN: r0=161(x), r1=137(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 161
LDI r1, 137
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
