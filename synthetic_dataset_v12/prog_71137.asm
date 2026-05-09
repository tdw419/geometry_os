; DESCRIPTION: Places a purple dot at position (323, 103).
; PLAN: r0=323(x), r1=103(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 323
LDI r1, 103
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
