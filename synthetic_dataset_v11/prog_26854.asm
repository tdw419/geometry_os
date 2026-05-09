; DESCRIPTION: Places a purple dot at position (241, 225).
; PLAN: r0=241(x), r1=225(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 241
LDI r1, 225
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
