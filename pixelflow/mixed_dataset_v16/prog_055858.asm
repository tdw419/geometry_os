; DESCRIPTION: Places a purple dot at position (259, 175).
; PLAN: r0=259(x), r1=175(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 259
LDI r1, 175
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
