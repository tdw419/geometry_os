; DESCRIPTION: Places a red dot at position (26, 168).
; PLAN: r0=26(x), r1=168(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 26
LDI r1, 168
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
