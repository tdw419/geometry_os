; DESCRIPTION: Places a purple dot at position (137, 103).
; PLAN: r0=137(x), r1=103(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 137
LDI r1, 103
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
