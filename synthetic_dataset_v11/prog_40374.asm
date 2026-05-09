; DESCRIPTION: Places a red dot at position (115, 68).
; PLAN: r0=115(x), r1=68(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 115
LDI r1, 68
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
