; DESCRIPTION: Places a purple dot at position (229, 217).
; PLAN: r0=229(x), r1=217(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 229
LDI r1, 217
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
