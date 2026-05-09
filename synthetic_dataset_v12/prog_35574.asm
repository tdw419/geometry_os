; DESCRIPTION: Places a purple dot at position (460, 102).
; PLAN: r0=460(x), r1=102(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 460
LDI r1, 102
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
