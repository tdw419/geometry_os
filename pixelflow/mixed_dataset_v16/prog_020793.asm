; DESCRIPTION: Places a red dot at position (266, 158).
; PLAN: r0=266(x), r1=158(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 266
LDI r1, 158
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
