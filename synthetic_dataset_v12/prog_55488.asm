; DESCRIPTION: Places a red dot at position (451, 35).
; PLAN: r0=451(x), r1=35(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 451
LDI r1, 35
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
