; DESCRIPTION: Places a purple dot at position (70, 241).
; PLAN: r0=70(x), r1=241(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 70
LDI r1, 241
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
