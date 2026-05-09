; DESCRIPTION: Places a purple dot at position (110, 126).
; PLAN: r0=110(x), r1=126(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 110
LDI r1, 126
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
