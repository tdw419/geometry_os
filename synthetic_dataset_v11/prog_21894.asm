; DESCRIPTION: Places a purple dot at position (189, 227).
; PLAN: r0=189(x), r1=227(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 189
LDI r1, 227
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
