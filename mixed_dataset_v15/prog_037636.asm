; DESCRIPTION: Places a purple dot at position (272, 72).
; PLAN: r0=272(x), r1=72(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 272
LDI r1, 72
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
