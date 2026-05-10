; DESCRIPTION: Places a orange dot at position (103, 79).
; PLAN: r0=103(x), r1=79(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 103
LDI r1, 79
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
