; DESCRIPTION: Places a red dot at position (162, 54).
; PLAN: r0=162(x), r1=54(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 162
LDI r1, 54
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
