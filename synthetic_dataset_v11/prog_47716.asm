; DESCRIPTION: Places a red dot at position (99, 205).
; PLAN: r0=99(x), r1=205(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 99
LDI r1, 205
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
