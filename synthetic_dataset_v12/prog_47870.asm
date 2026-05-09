; DESCRIPTION: Places a purple dot at position (252, 115).
; PLAN: r0=252(x), r1=115(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 252
LDI r1, 115
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
