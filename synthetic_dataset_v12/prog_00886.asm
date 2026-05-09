; DESCRIPTION: Places a purple dot at position (233, 220).
; PLAN: r0=233(x), r1=220(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 233
LDI r1, 220
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
