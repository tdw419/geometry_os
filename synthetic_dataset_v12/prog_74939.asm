; DESCRIPTION: Places a purple dot at position (15, 210).
; PLAN: r0=15(x), r1=210(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 15
LDI r1, 210
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
