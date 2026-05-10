; DESCRIPTION: Places a purple dot at position (199, 103).
; PLAN: r0=199(x), r1=103(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 199
LDI r1, 103
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
