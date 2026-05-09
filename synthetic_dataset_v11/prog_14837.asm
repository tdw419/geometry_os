; DESCRIPTION: Places a red dot at position (31, 233).
; PLAN: r0=31(x), r1=233(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 31
LDI r1, 233
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
