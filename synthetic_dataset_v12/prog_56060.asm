; DESCRIPTION: Places a purple dot at position (248, 212).
; PLAN: r0=248(x), r1=212(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 248
LDI r1, 212
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
