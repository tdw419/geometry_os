; DESCRIPTION: Places a red dot at position (339, 15).
; PLAN: r0=339(x), r1=15(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 339
LDI r1, 15
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
