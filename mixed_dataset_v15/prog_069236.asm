; DESCRIPTION: Places a red dot at position (133, 71).
; PLAN: r0=133(x), r1=71(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 133
LDI r1, 71
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
