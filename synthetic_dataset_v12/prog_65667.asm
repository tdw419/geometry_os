; DESCRIPTION: Places a red dot at position (93, 79).
; PLAN: r0=93(x), r1=79(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 93
LDI r1, 79
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
