; DESCRIPTION: Places a red dot at position (484, 232).
; PLAN: r0=484(x), r1=232(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 484
LDI r1, 232
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
