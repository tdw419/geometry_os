; DESCRIPTION: Places a purple dot at position (504, 212).
; PLAN: r0=504(x), r1=212(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 504
LDI r1, 212
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
