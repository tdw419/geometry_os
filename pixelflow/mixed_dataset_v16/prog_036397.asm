; DESCRIPTION: Places a red dot at position (129, 3).
; PLAN: r0=129(x), r1=3(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 129
LDI r1, 3
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
