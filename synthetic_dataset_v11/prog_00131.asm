; DESCRIPTION: Places a purple dot at position (36, 47).
; PLAN: r0=36(x), r1=47(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 36
LDI r1, 47
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
