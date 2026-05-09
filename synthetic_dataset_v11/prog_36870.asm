; DESCRIPTION: Places a red dot at position (155, 14).
; PLAN: r0=155(x), r1=14(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 155
LDI r1, 14
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
