; DESCRIPTION: Places a purple dot at position (207, 128).
; PLAN: r0=207(x), r1=128(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 207
LDI r1, 128
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
