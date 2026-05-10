; DESCRIPTION: Places a purple dot at position (338, 141).
; PLAN: r0=338(x), r1=141(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 338
LDI r1, 141
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
