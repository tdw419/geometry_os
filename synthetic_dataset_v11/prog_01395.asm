; DESCRIPTION: Places a purple dot at position (203, 116).
; PLAN: r0=203(x), r1=116(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 203
LDI r1, 116
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
