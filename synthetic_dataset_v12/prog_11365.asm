; DESCRIPTION: Places a red dot at position (10, 157).
; PLAN: r0=10(x), r1=157(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 10
LDI r1, 157
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
