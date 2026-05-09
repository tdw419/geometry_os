; DESCRIPTION: Places a orange dot at position (134, 143).
; PLAN: r0=134(x), r1=143(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 134
LDI r1, 143
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
