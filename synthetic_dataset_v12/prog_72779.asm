; DESCRIPTION: Places a purple dot at position (15, 152).
; PLAN: r0=15(x), r1=152(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 15
LDI r1, 152
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
