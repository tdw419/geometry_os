; DESCRIPTION: Places a red dot at position (236, 89).
; PLAN: r0=236(x), r1=89(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 236
LDI r1, 89
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
