; DESCRIPTION: Places a orange dot at position (130, 116).
; PLAN: r0=130(x), r1=116(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 130
LDI r1, 116
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
