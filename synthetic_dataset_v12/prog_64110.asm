; DESCRIPTION: Places a orange dot at position (142, 141).
; PLAN: r0=142(x), r1=141(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 142
LDI r1, 141
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
