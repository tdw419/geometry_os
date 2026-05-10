; DESCRIPTION: Places a orange dot at position (189, 68).
; PLAN: r0=189(x), r1=68(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 189
LDI r1, 68
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
