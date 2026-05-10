; DESCRIPTION: Places a purple dot at position (394, 98).
; PLAN: r0=394(x), r1=98(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 394
LDI r1, 98
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
