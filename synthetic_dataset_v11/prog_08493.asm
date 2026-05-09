; DESCRIPTION: Places a orange dot at position (141, 0).
; PLAN: r0=141(x), r1=0(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 141
LDI r1, 0
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
