; DESCRIPTION: Places a orange dot at position (314, 138).
; PLAN: r0=314(x), r1=138(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 314
LDI r1, 138
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
