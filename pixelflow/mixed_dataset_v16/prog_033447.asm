; DESCRIPTION: Places a orange dot at position (462, 119).
; PLAN: r0=462(x), r1=119(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 462
LDI r1, 119
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
