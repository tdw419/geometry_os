; DESCRIPTION: Places a orange dot at position (125, 212).
; PLAN: r0=125(x), r1=212(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 125
LDI r1, 212
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
