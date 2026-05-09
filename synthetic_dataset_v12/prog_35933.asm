; DESCRIPTION: Places a purple dot at position (278, 129).
; PLAN: r0=278(x), r1=129(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 278
LDI r1, 129
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
