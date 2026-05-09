; DESCRIPTION: Places a purple dot at position (286, 16).
; PLAN: r0=286(x), r1=16(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 286
LDI r1, 16
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
