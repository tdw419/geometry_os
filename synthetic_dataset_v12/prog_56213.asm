; DESCRIPTION: Places a red dot at position (461, 26).
; PLAN: r0=461(x), r1=26(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 461
LDI r1, 26
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
