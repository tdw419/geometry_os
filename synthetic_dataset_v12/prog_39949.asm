; DESCRIPTION: Places a red dot at position (315, 89).
; PLAN: r0=315(x), r1=89(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 315
LDI r1, 89
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
