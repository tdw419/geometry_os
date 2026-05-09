; DESCRIPTION: Places a red dot at position (93, 231).
; PLAN: r0=93(x), r1=231(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 93
LDI r1, 231
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
