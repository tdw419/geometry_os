; DESCRIPTION: Places a red dot at position (389, 1).
; PLAN: r0=389(x), r1=1(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 389
LDI r1, 1
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
