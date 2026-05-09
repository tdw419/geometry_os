; DESCRIPTION: Places a purple dot at position (265, 241).
; PLAN: r0=265(x), r1=241(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 265
LDI r1, 241
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
