; DESCRIPTION: Places a red dot at position (314, 139).
; PLAN: r0=314(x), r1=139(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 314
LDI r1, 139
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
